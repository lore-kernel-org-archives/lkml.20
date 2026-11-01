Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793524348;
	b=L7yYPpFhg1AMkDjfbyp0SIFU0/a3n+glfGtMOqXeBY9UbZyWW225LQqmUOk1z/E+4StX
	 RofpRsaRyTk80YsGJloreZcvK3EyAZyap4WqCrghoHjw6cuxcuwoW10ID2/z12C0WP2NV
	 eDd+9eyFS3D3X9GwV315aRkb9P/3v6seFPWy+WaihXiI+Aszb08Lm7QQeBkMtpXvktR/3
	 Yxa93UumzoYuhGTxByuzMl4V+QFfEA5MwGoPjvehON/hA6+AWv05tgjeomUsFgvQf3n4m
	 SljfeklPBE7npZOu0thkfVvlVfH72C9MFkMYiqpPKvQIOM/s9kynjdcH4LSRpSGOfcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793524348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3ysPIyTHoA/9Jg4MEjHSr/SQZx/nE08X6Q8EzC88lqo=;
	b=UPAaNqRAoMqTkKy8Ki3dCzoOf5NFGr6LU1JyEBcsoK42UwobyANzjpvVKg1Yq2VbK+qz
	 wme8uwhYgyecqJgsLHCgFN1tmvxhTVRC1KJ+/Cn5PwjsxaAKFXNW7YkMtgsXPyMn8BovL
	 qX8DpJIFzS0fUUJJ4aVmqW3+pYWniOrQFnD5eqSwoJotc0n+nprTcdkD3cuv36/ie7+DY
	 ZgfDrW/wEE9qO8DLbeijOH2MTg0JzgXliV0uJBk0lgQhYfY0RQ8N5ZVorddxurbN3Vgps
	 V0/h92sWOf+YEZjz2+BqCNnMdResL72l8rCmI+thcQO9fW7UGmrMDPSDtgDMwG7o4+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puwyvf3q;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC627606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 09:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC627606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puwyvf3q
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso2941711eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793524347; x=1794129147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ysPIyTHoA/9Jg4MEjHSr/SQZx/nE08X6Q8EzC88lqo=;
        b=puwyvf3qlFZ5aOotS6Fv74jcQIT5BCHjlUVjgKKARno+rxWB9U4MIbPywKVmbOy5ib
         MPcMbRF2foR/UqCcX3VN+CIR4q6fCNXEx8Qu7LCPu864hBm2fT7JlZWFBKLUjn9VW3p9
         OEfKu78cHecd6Fbo9xvEgqmsasteThfGAI9TwqVfmMTlw8cExiD5RCU8jNlIcEvmhZ/C
         qn+9Dk4+70eNz1u2x5qZ26FcTd1OKNWXDK7QV23p00ZwkCB2NewG+vxVTFLU0TNSw8Ai
         zGMFPKZ7ndIknLst9kZ1Ojy8c6pt/SypNNb5C8at0XmDKtG5jd9j2FWWc0zsIZw1IxeT
         vILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793524347; x=1794129147;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ysPIyTHoA/9Jg4MEjHSr/SQZx/nE08X6Q8EzC88lqo=;
        b=ggvoUo4SPWHwIjG1FBPC1HL8NsZpMO5EZCY2Ld+KFvLP+Kpcofr4Au7iM4sWWpXUge
         /GYl9IveYRCdl0r919yJNPgXdjgmlFcl972ZfFj4DFDQM2D59DnTuQ/dyQqazNrpTHSW
         V6WdgX0bDftqEi9QWSPnSEeoT/8OcAc8XJfr4bK5q8n97iSfQtwufABlc2MhhO41RAi/
         snNRhRHvNNNRIjWuU80WXTr2uVtDMk2OzeX4RUeXCAn40d72PsFaHPbUEQztK+4rGXVR
         q2z//c2n/vxCk2VN2BWHoKfyjLBGk64c7xKiZpO5w72GJfp+sDOfl8P/eavKEMOoUfig
         lmCg==
X-Forwarded-Encrypted: i=1; AKwUvBzKEL3kWU+qwS6EXKR/v8SktsYFZfc1oCSnexzVmVcEgUPAAnjyKvxmBsqFl7UEx8+4SqOADRXj6S6si4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DUtQyE4C9dDdufTnnkG3RaJdWVB3p9Yy2WW6yUWFOg75HEwOq
	lY3zK734QM70AfXl9qjXfLzOGkDHMxYnutTNgGZ68bwA5PJqTPx2szvm2aa4hfIg
X-Gm-Gg: AYBFou3Q4n0+ts8+wDXpKnGye+heEkECI4gq7ERiNm6YK8zIZB+zJnou2V77SUV7xkc
	SoDPjyq+t0AB+qGNWkk03QlTYXAvotDESYlpP2kEWEqt/D5XaUO3nyB+eDIVMweFTzM+uqc0NSF
	OoOKc6MeYk3aB6woOufpGNax4qxXy79u8xiuJmPMzYa16JRziYD5ipHuTO1LrlDcZdI53aq44YB
	4GJCDI1NQQzP1BxyWdJPk8bXLu1xUqyOLtAdMOVa96Mir/Zij31dgNKpMVURbktYYaVBaaVXV1C
	/i56t90Wpk2x7pRxGsyLxezLE+qrrttRwWV5QFZKcxO9qQpddDAQUoRTcsLNgLIS8t9lNzmvNkp
	A8jUWDcEoD5u0vVJdsKgEIW2lg1usEI07+48wbXCB3+lUijnpsWkh66pFeE9YTfJkBk6MP9Cv9Y
	xpjS4w17tnCC7W5rGjdEnsAMbTHoEv4Rm43gxJUQSm9Tx5Ve2cmuVUwmDdGjhcBACqpydI1/l4M
	gta3BYKJ7A8Mg5B+T67OBx/xibkL31T9W3jbViEXiUtQDxENN5XfHoYF7PzYm0xuH423BMXQzm5
	EMONrQE0JniuMOMciaMrPxqgKzWytsTzqEcXEsFXbNrVeK4Klg7HS6MBIMTcaz6qxxGD
X-Received: by 2002:a05:7300:cb0b:b0:354:1db3:674e with SMTP id 5a478bee46e88-36a42330b9fmr13797488eec.6.1793524346880;
        Sun, 01 Nov 2026 01:12:26 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm27037797eec.3.2026.11.01.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:12:26 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>,
	Sung Byeongchan <tjdqudcks0424@naver.com>
Subject: Re: [PATCH v2] usb: usbfs: clamp actual_length to transfer_buffer_length
Date: Sun,  1 Nov 2026 01:09:46 -0800
Message-Id: <20261101090946.1963739-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026110138-kettle-daredevil-ceb5@gregkh>
References: <20261101070651.1846947-1-teel4res@gmail.com> <2026110138-kettle-daredevil-ceb5@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

Agreed, that is where the bug is, so please drop this patch.

That was in fact the first fix: patch 1/2 of my original series cleared
actual_length in vhci when usbip_recv_xbuff() fails:

https://lore.kernel.org/linux-usb/179328314074.648427.388274461758949120@gmail.com/

I withdrew it only because Sung Byeongchan had posted the same one-liner
three weeks earlier:

https://lore.kernel.org/linux-usb/20261009122636.642575-1-tjdqudcks0424@naver.com/

That patch has been waiting since, with an open question from Shuah.
Its review had also already pointed out the case it misses: a returned
length with the top bit set is read into an int in usbip_recv_xbuff(),
takes the size <= 0 early return, and the URB is given back with that
length anyway:

https://lore.kernel.org/linux-usb/sashiko-outbox-165560@kernel.org/

Rejecting any actual_length larger than transfer_buffer_length in
vhci_recv_ret_submit() covers both. I can send that, or Sung can fold
it into his patch, whichever you and Shuah prefer.

Thanks,
Cheng Yongkang
