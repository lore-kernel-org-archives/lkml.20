Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300001;
	b=hhDZJCB9Uc0VBv0bWtzpcLXuckIB8QzWw1eDWArVW23QBqsiBG7v8TwGPHWs2CcqM853
	 a7OR3zFLP+hGDb2CxEFi6mTAsizHpYXhT/iUyLLxOfY+VnvhUK5u3YmFpvtHw1kWVkZFG
	 hv34cikg//BiER1MiGaTAgNqwqiUsoaR7OWG4ttmk0Wf2Imol8GoGO7Po35AwBELaELaF
	 ptgltt3JLz0JScnbX9jhyHDvs/5E3yyAsrBUE8+jlqbhbEvfiCApMbCeAHumbEH0aaBEz
	 uFiLmMQkZnnkcue+mY96XsOAFedeWs6NAkjrH1FX71+ZEZAKHbbYJHwZW8vLRvNcPDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZmWPzm2rbQXWS/0JLk7KpqQzmeNK5xYsM/YYzmVQZ7I=;
	b=K3UPnKowWH7ZjQWdkJhhSqlT1STBt/CNbYJMRYh0HZQ9HxCy1hmZChnjWq1HaasPG6Iv
	 s/jt2+8SSr/B42CdlYdrMWxAcdxUaKPEhLuULtuj3oFS2eMQUENStxKr4LewkvSNocajT
	 Pq/RCs0qVefgBqV7HT1m40bFrxfWkJAkwgN/HPlHcg9xiMvbCEi2JAvBLsxUYKMWOOY+3
	 RhC6fTy0KtQitu+g+TZUWlzqKjcvxq+d957akXcOOK2i8Sk7crpQR2Afx82hdoo7ENTeZ
	 /NQe1m+W0IcdiquKtgntR9IwN6JYtxW9oNr4Bmqf8gsHrxT5oWG8rLewwOqWF4kQCKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pnQrwzzW;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAE7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAAE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pnQrwzzW
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so25794575e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299999; x=1793904799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZmWPzm2rbQXWS/0JLk7KpqQzmeNK5xYsM/YYzmVQZ7I=;
        b=pnQrwzzWJFXGWIqqtBcOYgIXocVc1eXAuuN0Kbn/xmxox26SAFrcjwb93NkV91P3ia
         232Vd3U7fQvSdPcyXMu00uo/EiG6yj3h5/0RNetgjCGZ1t4234UVA/aRcqeKXFxxLvcQ
         ByVpUO3V2x/R0dgUlOtc5pWi+eGafBMGISs/3e7J9JtfaFzytl4ua+38ucMalcrhAZHJ
         c91loXCUe+s2XzhzNCxijty431eCWmyJtKgV21wNOwjtQd2X0cH4k7F9GCjRoKVtt+Hd
         X7IL5RbbxuyTAcSOs24sX7wLXnoOMtzWP0VyPDCmb53Hm4O+3kUv6yYYwNkjwsYDzQh9
         3hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299999; x=1793904799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmWPzm2rbQXWS/0JLk7KpqQzmeNK5xYsM/YYzmVQZ7I=;
        b=UfR4BHsM/0ygZpSq6+p1Vp32CpaxU6r1dyVOLEiAZBGYp/PWFbpmh5M+JZT8Y3oplF
         m05DQwlkVq3gWOMvmttUfhvjep4H4eu+irJWOZ7ABu15/qlGDeyZ6TYfR4Rdpe3uBKfy
         GGiQrrMKu/Cp7BiDjdDuyJly5HeVRbz4NOPG2juUOtLXkinhTT7BKmNFy5/5vn1M4i05
         8Q5BQALG3B0oJCxV55u8D1soNRw9b2Autphg/smwlnxmN+s9hlt73Y3msACI36BXM6k1
         VRWrqx66X4TXbkMgaDqrhfKfE0hwnXmNCmBG6Nf297985V3sIojT2vQfKtI4Zu+5kqWW
         NmDA==
X-Forwarded-Encrypted: i=1; AKwUvByqll8Mw1hDcvjUNtOe1wHG1VhghU32SWtnD1dsz8digzs0/T3PKH0bOb2kc8ZjorEZ2xTX6z0BQP1/xtg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3LLbxO2NbWYDMnFC7cU6qzb5VolTyko1DTg1dpjH/KvuPs3VK
	M1ScnfKcR31fkTBZBcjm+zDiFq1iUCPWW4SbAUR6+UC2mRzV7IqQ/xrZYL36XZ0ELNU9FHUF
X-Gm-Gg: AYBFou00nwb602RFoV1Q0QznG6K840MlpOxWJwOUU5ZXV5x0y/Ntk25S1AdmzoJtUZe
	DSMysuu7mBTlsYKGvecWgXOZQneSi2DT+RT88ijFBDs72auhL5u9ok8FOO3H/foH16pZMYPbAMr
	wfyGuUJG4o/JTg0B4IcFYGAiCs7UDx0o40yskzU/bSAh8jKKjF0H9B3eq0Q4pSbaWog15l0YE64
	sPFYwzlFe3xnxC1WJupidcDdz/lySQCz8ngS7nB8dfO5DoMs15em27oZ75c8mCwcZsxauCNuSrb
	U7izlYDQ1G9+pNMdEawd4+OPNOj0M1Yjo72Wy8/YxMXVKUVgKE45GJmipjoDLXrZWtVrxJjlDL/
	fzDibbwUosRiVmRra7HoqgbpEG3gJamLVxt4QDB3TqeoBAYyGCGzh6promOk/N9Zcawd7TbcKVK
	HOLXKmbIUW2Bj4dromapuK+WX+6+OjcpmPsc09NA5j7CQABsOW6aQo1T1AiHG9pDGTMOXdlTMHF
	DId+00wuvdIQHEM8u7ddpjgLn1dqfB5Cwf/uOUGKL467ZCCh+DvwmoJtfeJtdt1FWnvVfFjimlp
	SxTXyDcoSKT65zWGlaw3UOE2yepHbgtyLNAVc35VjOPyGqmcqlggAwngP/qmNBfMgyGEn63PF8N
	BpO9UQFjKhfojB4hwYR04YM5n53/Rob2F9h/yoqJGscUgqMbrIqa1y7RgPhvCQbV2ZGA=
X-Received: by 2002:a05:600c:3153:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a9677cb34amr150195915e9.29.1793299998954;
        Thu, 29 Oct 2026 11:53:18 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm4779985e9.13.2026.10.29.11.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:53:18 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:53:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maria Sheikh <mariasheikh812@gmail.com>
Cc: outreachy@lists.linux.dev, vaibhav.sr@gmail.com, mgreer@animalcreek.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager: Add newline to sysfs
 output
Message-ID: <auOWGu-Hja90eAmV@stanley.mountain>
References: <20261029181948.13121-1-mariasheikh812@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029181948.13121-1-mariasheikh812@gmail.com>

On Thu, Oct 29, 2026 at 11:19:40PM +0500, Maria Sheikh wrote:
> Fix checkpatch warning:
> 
> WARNING: return sysfs_emit(. . .) formats should include a terminating
> newline.
> 
> Add "\n" to the sysfs_emit() format strings of the name, vid, pid,
> intf_id, ip_devices and op_devices attributes.
> 
> Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>

This changes how the sysfs file appears to the user and potentially
breaks a script or something.  You can't do it without testing.

regards,
dan carpenter

