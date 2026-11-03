Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703005;
	b=STUPY8FlDeQKLFoDSFH1SXR1ex20aKrduYrohpp+hkvtH6gP1jIiBqg9X+y/La6+48jy
	 /E1SjUstX/ZSRr6RNelJeXJulJFIkxoZXbG9ituI9GbHqVm37fXFXsw6DSY4YZkus1pW1
	 OXYJgcLExYzexFw+lAwFuseAsCsUKis2wKANHnGT8gQI5MW74tnpV4qIiPUyFVIYunULQ
	 zHso5FCx946k2QqG8vUZneGQzZHC1MTyylggSIv8ZzG3cqeY1e+UpTovjeTR2LXOZDBps
	 hh/obknJfOUKcu/w1LoJ1vJ6e89ih7WGx4BwfwJcfMGVQ3lQWYgihlZfHUp8FrPqynA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wau2FUWXSJ8L0Yn3adOD+MyMibyJU3nSoKHXYa9IjQ4=;
	b=jeBH+WrKmKB1jAuvNWYlp59F+oDEMp9T1Ow8Rc/4J5vOb0nVfmG5cYf/jk6RwAyVgfzC
	 fuLnHA+MJzz4X04UM+U177o9p5p+/s7diwxsyCnUN/H38LKs9PPhImrwRmBO5jrWICT1v
	 zj5URr6ptF8J76Zv0R2dZNk6wJwErbvnbOXl0tqQ/2o56Z3iAbphLaR2H5YAp/cD5SGmY
	 JGroKZlFfyvr4Wsn2jxCvSU7UAAmcGdY4Gy0yHOEewazIn7in2GPNRedTddUxViyOR9fC
	 m+kE9X2yIwMrLC9xHvyY+GJtxxcpWWSxDvDtQUx0TctJAvtqiH3gtERXPuJe17SvBaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1uDtR2G;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15205606A803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15205606A803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1uDtR2G
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so26860865e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703003; x=1794307803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wau2FUWXSJ8L0Yn3adOD+MyMibyJU3nSoKHXYa9IjQ4=;
        b=R1uDtR2GjYitzFUJbzR/erukacxzIZ6UswgedUI1TL4nsNwtEivwIpbh/QgW3VoSVw
         h8NOB4q34uPndd0SoDUkXVh6n5svKbp1P01IgmwWyycjIilv3o68tL6arIAoFuUS4Lro
         j2Rubde310nQRRPjQOQpwwHzNADjt7rFh137pBRjZULnPOADmH82Y5mV/U7ACOUbr6WF
         ZlOFm728ne4gRk2gT40UPzRGIATbh8Dc4Naxpq0qlRYzGkThuC/9VzNGyFQmc66MO39O
         jeQ9qaMsO6rhRvtzLqHyNCXy+8oWyxMjGUm9vJZjV2oBSviONwmjnCObyZ1j2tCtIUzy
         xmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703003; x=1794307803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wau2FUWXSJ8L0Yn3adOD+MyMibyJU3nSoKHXYa9IjQ4=;
        b=opp0Nd5+ftC/UQJuFZgJ7f6c1PG/0/VPUc2X8jcRvoSk3QkO0db4VUiNcqBCrdjYV6
         lNq6pEfa02830zBAIeXm4URWeadmdcxDrvQeIfjOibAfQitLMQkhFrRs999Y8HC4Xm/O
         b4my9aIVFVECeByXggIdN9am7VMOU30TFzAwDpWTKv99X7y++fXlRDCGbBAFXDcw0Yoh
         9rUhHRr/O6XdHqa3wyJv2WlP96il1S1160ARXVC8107MFEAECqTHfm1qqwf+Kg2QEJBO
         69Co04GSnTGd1pcQc4TbEayvvVym3eMGhoZnF5/he+SUhieuGatJugHXByP4/1hXOKlR
         QbTA==
X-Forwarded-Encrypted: i=1; AKwUvBwPLcLURg2zX7yE2iQZViKKpP78+VdML7y37kIk0UPpUuq6JPpYFqpY8er8iQmADE32/v66ARZpHm2tSSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KN4ZNbN0bePsCGM4n2lkdGV+Ffsv/GcQEV8+Tj2PYMzHSCrk3
	lyr/3/b03NuANBmhgGn20IeiHv9RNDaqv2/G9fTpBh1IMM+deRY/ZmwRB6cI+74T
X-Gm-Gg: AYBFou1ozscWpDyTI+hVExzHc8kAEO9b/x0vrtb1vyIoQnse5mZ5CsJdgPH0nmMr3oC
	2Ubh4FMAkWwrWf+Nzns4NOR6Ml2gMMiD2ikaCEcMTQAH3D/xDrAxFcwsWvt1/Z59ChBbPKNSUiv
	FTPUF3CEYPL4pTl0Qa3ygMt2Wc8zQ0PaBE4utuzOWCN0eTYXz1uoBCwqBSVCWlr1fpRsNpzES18
	H2hewBTySOcusqrHZNN3WLcMwPnig46kIV1FQJsuBcAsfo40wHwJQF+afjE4qbAX+KqACLfIkAY
	SekPGhb4D84ZxK9Vh6RjwuYnRxsXmLcsNE9NS6To3+MhQPbzf57Y5HOn88K0i4Qwvfbi9lzw/tx
	Yox/Ib65DeTHqGpeq+jR2etSM0ci1aK+DcGKivWV4YuhjW9bOYhGID6RCWjXumnqTzV4GCVLdQu
	Hu/+neUx04RXutbbye3OUOeOq9/onlhJdI0qFTcQmsSMB1DWKDAKZNPupO2hFQy7QemsYVeQH7V
	j1SonJGxjiNJ/xgFfup24+W3ePRbR6XcwSM9rLSKvyz1dBD7kuErK/1K7V2vNc2jZwys9zLZUEZ
	2cABH0UqmsNJEez6G0I8x3InWXoAMpFDsE0gczNRIKIS/fevOJ4Mp9UTFg8g3Jf3
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4ac150b38dbmr298757835e9.1.1793703003355;
        Tue, 03 Nov 2026 02:50:03 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([2a0c:5bc0:40:2e26:a33e:b98b:394:e242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm74970585e9.3.2026.11.03.02.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:50:02 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: i2c: vd55g1: Mark the AE lock and bias controls inactive in manual mode
Date: Tue,  3 Nov 2026 10:49:58 +0000
Message-ID: <20261103104959.52785-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <auh9SHrLKHTjENwY@kekkonen.localdomain>
References: <20261101195006.220657-1-fernandorimoli11@gmail.com> <20261101195006.220657-2-fernandorimoli11@gmail.com> <auh9SHrLKHTjENwY@kekkonen.localdomain>
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

Hi Sakari,

On Mon, Nov 02, 2026 at 02:08:40PM +0200, Sakari Ailus wrote:
> I don't think grabbing a control is a bug as such; it's normal that if
> exposure is set to auto, you can't access the manual exposure controls.

For that case the framework itself uses inactive rather than grabbed:
v4l2_ctrl_auto_cluster() sets V4L2_CTRL_FLAG_INACTIVE on the manual
controls while the cluster is in auto, and vd55g1 already uses it for
its exposure cluster. The AE lock and bias are the mirror image,
auto-only controls in manual mode, so this patch makes them follow the
same rule.

That also matches the flag descriptions in vidioc-queryctrl.rst: grabbed
is "temporarily unchangeable, for example because another application
took over control of the respective resource", inactive is "not
applicable to the current configuration".

vd56g3 has the same two __v4l2_ctrl_grab() calls. If this goes in, I can
send the same change for it.

Fernando
