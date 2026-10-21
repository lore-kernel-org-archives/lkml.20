Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563644;
	b=E+xvYUFNRsiZZhBReuNcsiWt0H2SizIOfxT3sQOdC3Hs3FRa2mAJy+uu4WmmCDwI3XQt
	 e0H8uVvTQuWXBOVNUP6BRa/Ocbmw0F3FoKCCN4k3YFhDkl3bBnJ9gGzucSa5Ob5eyJZy+
	 qNn/t63XGZdUFR7gFkmw3o3dLXLHA9JJAeBkUwwAUOfAla2+SKe3Kb6QYk4ny36DYxbwo
	 X1ui+I4Dy0J2gyfBfKLg3FFowuiOz65VHc2ahATvVqgqxWWETRxCDAp9jhB+Hr2dQDAli
	 6isoJIXjEI62HilfBaGQCHJqOaD71tn3Jj+3Jsp7jXopLBM+fm+YEgSLfd2xFdtBXUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=grDIDaY1+sQW7ow94cMmWs0H6QTuDMtRAuNpJ3QVtJM=;
	b=ZaA8I/9Rg2t5X5ZZRY3d4Yh5uhVIsxaT0cbsiwjoP6appP6GGn9g7JtVzbBNm3yqvTph
	 g6XYmhTXqbUWPbvvIXp/TylSn6IA3H7sb3yKTeYo6zG3WgDDn7L9grYI3StI09jYMjHZe
	 lZFiaibCQc1E0TIy3jNHHfGuStxFj2Yo4ZVKAlcFHs3yS5hSzKTGAplOnIe+sDoTB0SrS
	 lBU1VddYwNpau31HdDVszXXSChM7droraxG+a2oPLp7TfVoiS23qZrMrBn5LfV/dndexz
	 N41gAkKtKwk5NSkg8xR9m5Kk3iep/L0lAxt1cm4VBGS1Yo45Crw9uZwcaLUXkG5U5og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qtja05MP;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D789606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D789606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qtja05MP
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso965897f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792563643; x=1793168443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grDIDaY1+sQW7ow94cMmWs0H6QTuDMtRAuNpJ3QVtJM=;
        b=qtja05MP78WgfaUL/BFeqXtWnuVIvnMuz7946Xqt/vrDbOod15KLW3/r78CiznhKiq
         27Ys6n1tcL643tPROG5J/0WbY5iAW9SoOi+Jbj8djkbl1/y2NE5/YWHWKu2VXEAiYiOA
         TdSFxa8QzadHDBeV5BbRXliFahizVW+FauxEJFz+6Y4SNyd4hW+nll2jHLoQgQ3ecnUH
         nn3XsDztsfTBpWpRAIOoWGStsjIFWanFvnnRJ/w9qQr69K2tmQ/fWWwcs358KkB1Ar4s
         jWBkv0xzszTlLUyaBBuV2A3U5XSEsQxwpnxiubkMt4q43N4gXxQ2ul2fuOs2pXNiYWxd
         +vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563643; x=1793168443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grDIDaY1+sQW7ow94cMmWs0H6QTuDMtRAuNpJ3QVtJM=;
        b=jsBWZEORVChuaWyalDHvLZYRodss/C8wMbrfmATyX7ywuFRBnm6V7kiKGBxWVABCOV
         eZv5XK1dT5VhCYlYPwQdIQjDHWcxK34yiy1zzUY3dbnWMJcqAbYbDYP5ew+DILFGzLqR
         IKwEpQTjP+UgVu9hay8GKikPSux0eea++0+4wO2pOXYx18fq9r3bQGIgiPAX511lJ61K
         KE+md3vc9AfqE2k8VL877aQhISXTTjALeIFWhocVr/GoMc8CJx4Qn7oMlchNbMrNSpPO
         yQjvfrl6r+0OF2M4Xka6gvHXKcSQdIv6z3i73mPXm6/n7sYZVMtZuAwtS5HkTN9Uykyc
         OLGA==
X-Forwarded-Encrypted: i=1; AKwUvByksHPb43/AtDia7I3MEbz/h2U+VboCwJu/HnfmZlCPzhAN/L46IqKYfGGY9tfpLHpy33ggMrO6UDz3Vrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc2dwH11zDn7cs97GVMPE3eiciUICG8R/vEbODAGjkQFLUEtyr
	YaKoz2en1ed7jqe1zTwgC19AjQwB+/C6CZR1t+8CBZn/n1sBCk6o+Rz5
X-Gm-Gg: AYBFou3UcmTMcGa6VRCVKXG64roVHELzUpXTp7qaXIj0csZGV7zchR+GCYtg9UPFz0l
	CcRm4kytEjY/ZFglWvuqieZ1vky6InTTshp+1rb3FLXBJfmLviHG5XyUMeNUDHosd9YXncOjebX
	ofRIM/eO8ZjfNZjKZwJa5L3d+iY/6oRrXEjjJ/33riXDUkE4ZXklh7x40Hqdysq3k+wJ5cG92vd
	TvTatq6TG9g+/Xem8oxriEyOVZdAia+TsyB2Nv2WRW3TIATwti7tIIZcq7DkABvBCfVo3Uid/SG
	03kNnDTx5GCKiLen6ocesNwHBY1bwmanfK/b1/UJzBmh3AyhK1nRrnCM9BkhxweP55/r3R2GnlD
	vI9pBLDA/OfrvfdHHfcXbsUZECzD5kDBo2BkzFRd9yvDDvKi2B5CTHX8V03XVPsun15jZ6nlPZ4
	Fe9QhWL4jchId+ogxRJR29ZL96+E368IgfNzZV/orw8ew8A4kQgCNre2+HFNHnVToZ8Wi7qYWOd
	NdcehDmy9yC7uL3WBtmrN8CN4qdkb9Fgrbev89agOfSEAxWRqn4Rdhyd+Oi4uuTr9C39QutB13s
	plX5ZDs=
X-Received: by 2002:a05:6000:642:b0:48c:5a7b:7573 with SMTP id ffacd0b85a97d-48e1e9f117bmr8336048f8f.29.1792563642643;
        Tue, 20 Oct 2026 23:20:42 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e3bsm3386953f8f.31.2026.10.20.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:20:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krystian Kaniewski <krystianmkaniewski@gmail.com>,
	Neill Kapron <nkapron@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Wayne Chang <waynec@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH v2 1/2] usb: gadget: u_serial: keep the port until its tty is released
Date: Wed, 21 Oct 2026 08:20:40 +0200
Message-ID: <20261021062040.3973175-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019090904.3264978-1-mehmet.fide@gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Please drop this patch. Krystian Kaniewski's "usb: gadget: u_serial:
pin ports while TTYs are installed" [1] fixes the same lifetime problem
and also covers the two holes Sashiko found here. I have tested it and
replied with a Tested-by.

Patch 2/2 does not depend on this one and applies with or without
Krystian's patch.

[1] https://lore.kernel.org/linux-usb/6941beb7-8cae-4cc5-ba07-e1c8a8753fe1@mail.kernel.org/

Thanks,
Mehmet
