Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C09448382
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189521; cv=none; b=klXZ77CxOjv4F11tXpTCj6AqISHBEGIYVfPxf2+18PUwi7vLiqPmNKJtXZRMrQoVcpaFKtDnwVXRUYfLVAVbZt4BR6P5+WCWptQSaLBBKk1+DT0+k0S3sZs15PjFf6bSjquFZ1Oueir2tqL8KKnzILWRBw7R+xd7C3Qt/tUWSy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189521; c=relaxed/simple;
	bh=wr8nKQRVMvFmNlpalpzhVjt9cczrfUGnQQrpEM2oFRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSrmsjuA1gOocAERW9yZU7ISsbszKlEUs5dXYe9c7y7WEoMDgPfUPF/Nc2h3u7Kvu/3hC5TWMlzSw/RPVVOPamDK1zvcacnBexaf35UEYqCTdewtKzRvUenrk0b1lJkNepj6ID35ePIDvPJGjq+tFEbVuEPvpj0XowL4+RGTqRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qr2hZr1W; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qr2hZr1W"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so3816795e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792189518; x=1792794318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0gV+4463GGhxnl9k0VDkO8zdfsUzpizNELkAcN9qFo=;
        b=qr2hZr1WF/DP6wPL+hw+wF0r2KgciwrvMX7JpoPPRXhlBza/77KO0U0AIrQ2chLOzb
         3/H/vTbhphBptrxbdoPTCjNWJeeC+7u/bYIzk/2UvpRr4gXvFBgxhxqQ2gRI+jY2WW1A
         QN9VstdCGxjKclFme4TEqoCpskxWZprwcR9Vh0BZF3WH+65w8Wyd2py3EWqWyPYtNGWg
         a1IjF4D5qj4XNjwsB/SKv5eqa1HN5j2BIyEz+zrEclGwxH220N8R9V4BGvbWedkjY1JB
         LZ8wITZ9FjYNgp8McKJyuhWJz2ep3xSr0BFmXGVn4B5nR3cOoUvqJEOs3scFS/WJBqIx
         ePWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189518; x=1792794318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0gV+4463GGhxnl9k0VDkO8zdfsUzpizNELkAcN9qFo=;
        b=OpOUb/qdlFOVJF63WWjYXrYie3LJyMEsfR/VzeSMEBfUYbU2PD+EPvWw7tJezenU3q
         mO18x2tupLyR8CrYfW+7xUMskBcbOLAJUtkLnms+bwnVJx6vvWhqgkeKf4TSV0wT5vPM
         9UQCis2o6xUCDJi5rDqTnXtt22jR6RqLuxfYrnSliReRqR3Tzu1IV4T4vYh63hFGvl3h
         TncJQ+viA0Ph/VxqB+/m6b+ydvcQp0Sw3Idw8gh9LSfk9CXzyN2kyIb2e+rIzwSrh5Fk
         2jOok+v4t+2hYHP2PpsdHGx5aHCHcLkVBLb76/lGYIGgWw9whnvCLwRu0gNQQ9MW13VN
         iW9g==
X-Forwarded-Encrypted: i=1; AKwUvBwVmi1XOpaCKF2Ewld5TF5dngJB5H53JiPbdrjEN4TIFpxzFoI515YB1mcqCAIFT1PYJtQuzMGmYcn8WSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfrIfybnmDz1jqct4bilciFeoR01FKTH76cn95jRXm/SW/MMwa
	ZNmr9sJCb7v5ivClr0a+5Xhj3Pg8Czcm1Kp0XtKfv5A3riO6q/4I8frE
X-Gm-Gg: AYBFou0CNmq2xUrGEXBGH5vSB47UuCQ2CL+MdPUERNmHqfSmQzdU7+m/q0EFDdZQoQH
	myoSV3D1q7vZwtL9nGaOIK5Qpzyx3CXHMhG6kTXpemvOpck3YdeKpQfl6bfvuHOFVZN4J7XW/gr
	iaZlweseGy8b9T98pmfDG/7ZfuLEsvJTdJY7GMPJZxTVfwpwmLg4lsz5UOeYT/GnFiaFO8k28Lc
	Pe8oXA3ln+3q2Chxn81Ygqj261XJ5A+b1u6I9pZmBzTGCP25893J4riDrFj5LpcDqYaKO3aILDa
	wm1u1+Ki4IEiHNQPFbfWKB6EkuHEaK88OjyGxvhXBXpjKHhiqpRUTyDqkKiaDG+D5HpRqDduv56
	kJg8FFSiUqnn2kvdDqbFjbrYoX/M7mmx8guPkNCPGuDurVkhhJCuSXxf6mLnz5RCrCcQvqU2gOX
	c7K87QfS2aWfcJ7y785HdNljFp4Nx1C2aGUHhfSRiBelZOrjAJM6Z7k7cpMnzae2IfYZoxkURBC
	l6gFcmUcB09P3kPbzaM0kVGWZVq4WYqN0cyY/4460Ium42K6EY17iW3LZklN9TeTP8ZHa1r
X-Received: by 2002:a05:600c:e54a:10b0:4a1:a475:d885 with SMTP id 5b1f17b1804b1-4a1d7634d26mr15613985e9.34.1792189517741;
        Fri, 16 Oct 2026 15:25:17 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4feb6bsm8149752f8f.41.2026.10.16.15.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:25:16 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Andre Gilerson <andre.gilerson@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] media: i2c: imx681: Add C-PHY support
Date: Fri, 16 Oct 2026 23:25:13 +0100
Message-ID: <20261016222513.23355-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016211450.62994-1-lsa.uz@pm.me>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com> <20261015-imx681-x1e-v1-2-fd22f5f3b0c5@gmail.com> <11f1a19d-7d57-497f-826e-901f9f88b99b@kernel.org> <20261016160853.193378-1-geocausa@gmail.com> <20261016211450.62994-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 22:14, Sergey Lebedev wrote:
> Either way it does not show C-PHY here; your reading on the Snapdragon
> model will tell whether the two differ.

They do not. Read on the Snapdragon model while the sensor streamed
3844x2640 at 30 fps over one C-PHY trio (linux-next with the PHY
series):

  0x0016/0x0017 = 0x06 0x81 (model 0x0681)
  0x0111 = 0x03   (CSI_SIGNALING_MODE, as written)
  0x0114 = 0x00   (CSI_LANE_MODE, as written)
  0x1600 = 0xff, 0x1601 = 0x03, 0x1602 = 0x04, 0x1603 = 0x01

So 0x1602 reports D-PHY only even while the part is transmitting C-PHY,
the same values as on the Intel model. The capability block cannot
confirm the mode on this sensor either way, so I will leave it out of
the evidence in the commit message and say why.

Thanks for reading it on your side.

George
