Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564966;
	b=4nIh4zneUcDavRQZjAcJoY06O83Bd2AY1xUiFnLmAp181CEInQeQLz2p9E46iKnW9QP+
	 T3DbV60nBjBBSo3jd62/INEsJ9RaNBJxHsftFa6Nv8MB14bd2MI1eDb7wk34yxQ3UST8u
	 5a1eP5R/OJ6O8xkUKqjRIGAqj8ULpBbJkyCG6UbOYKofVRZGdeqFjvgZaRPhKcAwtdgBe
	 B7XNpu7rI1IB5TZPYBiIhVr3EzdfnCdMZEFPG8edKVKIBIXecMFs0bxtFv2C/yImaGS5D
	 CMD55XV+9oOr9rfHiPKj+7tcshILffrGD0TPRxXDdtL65xsQ38rQfGKBbAMWLwNrxuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D38HS46K1Anpqtgv366uGkYPf3VtgpYY67fcn9gWXQk=;
	b=Hiy1HOQ0xA/AL/DniwR+B+wPO7U2829aSG/uHtn6CVeABPMbtF0YglFv8t33JTtB/twu
	 yfcrar8D0YHYLSa5StE936/YvTUkmzc6o4ZzbZ7mrJ9QT3EU4dultS7YW6yCK+O5cWslC
	 8sH172vceMT+cZOC8aKp8PqIwDYnGIZRDmJ8pE4ohU+kQ7hAq4WsW1DlEyA89061fQtLV
	 LnW0hKBkvdsfhZdCaWvzBIqKS/TrOkE0ypx7stq+GAG77C8kJ9ZCz+JUAPyN/0GKapOee
	 joCmK6BvwnWQHSsnKd+7wlz0Kr4b4o+UkwfELSSzk9TAQVoiFOabu4yWY36k7CPKzwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ekPj1euz;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204BE606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 204BE606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ekPj1euz
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ecda93627eso217694e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794564965; x=1795169765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D38HS46K1Anpqtgv366uGkYPf3VtgpYY67fcn9gWXQk=;
        b=ekPj1euzwFNINM3LY/2Yy5oFUXQUaNX7uXk6VMWpoO3ye8qatgbeR4eTIWD1Ji0lqD
         p+5eT93E88koyid/4LR4IE2uGr+A59MCm8X/g2PMF4pZgul1WBEW/K6idvIkHiQkSB1q
         sW4SOR0FbTs1g+wUtKLEEVU//C9A/NpP5WIsCvqf7XB58+aGio+0P62UVsgiGku8RgFm
         2iWpG0QoW4eT61Zrlbam/LQ9eUj8T87xhwY83xNBy17p3P4seFCqpcf+mGP34xR3i+XZ
         gewDZpG1ZDFO5V//aLMGH0yy/TccY4c9dfpp15K0BokO2t6F7phH6uILO0s1ag9iOrmP
         ZJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564965; x=1795169765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D38HS46K1Anpqtgv366uGkYPf3VtgpYY67fcn9gWXQk=;
        b=kT/NwiH/9X4i6eF1VWBmFa8pSb7bia2ZHAuoKrCGUmwzPjNlTLRt2H3ePM+UpgW6Jd
         /9kPT5/B7R1aqCfu3+OsKvOJfNlVpU2VydXSSmdPH2ZuvYI37he8n9VDEz0kswSG28Ku
         KLv4SYhkP1VjQiqdQbqjuv75P7KbCkU0RV72cpEWLohGh0ybs1cHn/9cEnT0bh8Xl2+2
         syEROcHe0oEjEBRs7zVN+dCaXPg4w9QS8/40DqdEclbgL3AQ0LwrslgNj5rzZWmS0rL6
         ULIZf+zmomH0Zs1AOtkgY2dBC6RDJFXtP5rnl26uSn7m+i8HZwVZyifCl3LvtyVCn+G8
         R95g==
X-Forwarded-Encrypted: i=1; AL+hErHNYkPrOxWJ8rmfvp59ycYkzlPiNugGFLB2G+DvOD4HYGXPHTKXoe7pr0ODirdGsCeluOfg2N+HsImE1Dk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9etNVgT5/1iIXlEGXcIVTY2SpIyZqbPz307dWNOELNmfZ2XGHC
	OytDihsNso9iq8UGFiqnl8nxIHZ3n5qnf9lFnOxQA8tA2xu+jcy0/+qQ3ARZq+/Q
X-Gm-Gg: AYBFou3k5OBg+eZ4rcR2JEmYE2MMehF2LZj5MJlNywL4cv11waCTKjZlBFQUHAknqTI
	QbOe0GqOYkhRUoS/LLC46SaL3+Np0x69+1v+3I5THk6dhUtfPj5KNsz74WEHnCXYhOWjzim/HVI
	U23pHdSBv+3qh4gy4w41wvbg9AKnEZkWyFF4GplEnpIIAchzTB85qDZ0bN6xdc/1ZPZDfOaz4mb
	q6Q4oeZr+MvhTIsf+VZGb5Sl4zq7QUkCbFS6K83Lk0y2flJkf4lcLRWblD6nEtzmO6g/SvAT0H+
	lQn4RMMjaClZemSQOC25tp3W40ecbNOeAASa0iWJMaLNByJUPIl7AadTVydhpMoyWWpcOsxQ611
	ZsPLueXBW8YOzQ3BY8XeAw4eZbWoGnGAHHWTMC5dDvDR1IxeUlpyl1l55xKFWOGlyEjpNVxnfoN
	VtnYm444NFqaSEuINvsc0Ky2KxPMLPrFQxxHPOsP/5HpB+d2+4W1975nsUnC3QXcDA82dWZfedt
	nlIAKT+pL01MQAk97GdyIzGeRyr1H4nnHUNEF02WRp8kLcw3RgxOuO0guMkghu8PkrXNgPIOOXp
	YUAkjUG3rw==
X-Received: by 2002:a05:6123:49:b0:5e5:29f7:489 with SMTP id 71dfb90a1353d-5ee34afcfa8mr472567e0c.22.1794564965007;
        Fri, 13 Nov 2026 02:16:05 -0800 (PST)
Received: from fedora ([2a09:bac5:565c:aa::11:1e5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e67eeesm940971e0c.10.2026.11.13.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:16:03 -0800 (PST)
From: =?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: fix asymmetric output buffer pool accounting
Date: Fri, 13 Nov 2026 04:15:54 -0600
Message-ID: <20261113101554.68060-1-aleszlucero@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113091847.117705-1-singhpriyanshu9838@gmail.com>
References: <20261113091847.117705-1-singhpriyanshu9838@gmail.com>
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

On Fri, Nov 13, 2026 at 09:18:47AM +0000, Priyanshu Singh wrote:
> In cvm_oct_configure_common_hw(), when CVMX_FPA_OUTPUT_BUFFER_POOL differs
> from CVMX_FPA_PACKET_POOL, 1024 output buffers are allocated and added to
> the hardware Free Pool Allocator (FPA) pool. However, in cvm_oct_probe()
> (err_tx:) and in cvm_oct_remove(),cvm_oct_mem_empty_fpa() is called with
> 128 instead of 1024 as the expected buffer count.

Hi Priyanshu,

A couple of quick comments:

Was this found via static analysis or code inspection? Since this changes
runtime buffer accounting rather than just coding style, it would be helpful
to mention how it was verified (e.g., compile-tested only) in the commit
message. Also, there is a missing space after the comma in
cvm_oct_remove(),cvm_oct_mem_empty_fpa().

Best regards,
Alejandro Lucero
