Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010152;
	b=CE/uTWB5UtioQAKsSInBYeqvykEu6OT5Az4R+LK5bbD/5ty9iGP1tizLIyRIZST1EvSq
	 vweVxymKcu80jusUJUN12JNYGd5P5hrnFgXj2OkpczgEWU4e02FR4x86zButDzWIREh6A
	 gZgofMmRkpBGskMnTflzzJN+XT3K8Ujl6o6pt7X8M1+DY/ljlqVRfYtY96Y6sqjZPajVd
	 1Qao0ZHvukHgSmIlPXe/Fy5Y179oXdzTYSGaY70tYumpQLcqtaWr3J7YajT4xEfIaSloO
	 WQqnyhoRvKOo+D1LU/AHdImWRMXxHjkybfAXZqdDzNKoPE/ymYPU+UhjV12uP6ev4IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010152;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TMUIa6NXZkT5J+VgXuQQxCc5HC+EqyVdymjHgA9IWOc=;
	b=p3YM/R8Ctd3OgzuiKYRcWPBdd48J3ZlJHyOg4zyAWk4z67/UTg/Oajnh4HpCXEXiWRwQ
	 wizKeGfLzsTeb1lLmV+EQOIDwK0Q3V4TE2ckSpCNoRXy3aSeFte3xJ9YHt0bmb8jNkUV6
	 PtAvTiRTd7/II6Xv2UNpLa34gN5qT4KjTmzdUHeAHKNzLCWW4hxv2RrIBrdAgkS3nXBo7
	 HSi/JagDtZDNJYUwBYp/pEpVHbCersQ7jcfXRqIxxgaa7oDNsljC6do0XhmoYtKE9QP+O
	 jLxYS9dG6xx0PCHYVmblDlSmp3fAJoeXnLxGAQkhAnLm19chrMjXg3ElpLyu4zpe6vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZkPdcdwT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tcEdmDeb;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811BF606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZkPdcdwT;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tcEdmDeb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TMUIa6NXZkT5J+VgXuQQxCc5HC+EqyVdymjHgA9IWOc=;
	b=ZkPdcdwT+tMpL0PHDgGjqbNFu8/F3+gmSd6m0aynWGrueIObQhA33ZFirXDo9XF8QaewHK
	R8DgVjQ9qssVGt1cWE1ph685KSX0M6lrtB/Jdi+DjpnMJLDNyCuJPdNXum2u0+YtAyaVx1
	JIJUyd+yUMKUl+gGg/wUF73Y4Seh8J4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-8JLuVMkTOlSgbQngEGhSfg-1; Fri, 06 Nov 2026 19:09:09 -0500
X-MC-Unique: 8JLuVMkTOlSgbQngEGhSfg-1
X-Mimecast-MFC-AGG-ID: 8JLuVMkTOlSgbQngEGhSfg_1794010149
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ebb902eebso6841756d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010149; x=1794614949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TMUIa6NXZkT5J+VgXuQQxCc5HC+EqyVdymjHgA9IWOc=;
        b=tcEdmDebW39kpg5vgSNJ0q9f//+sf8X7g1QPI8DYbaGnrMpCNPGGTeYu5Uri7bOC8M
         PuG+jqLDVny8muLi1PpTCTJLErKxqGqiFNu7vldkuvCzFD07kW5fPrI45M4VXbqk7uta
         QtkAznq6je2MolRmg2etstUAZvzWKZ4tJaHfv6bhBUfXlFb0b2PUvqJGKetMpajfe6GR
         4I7I3t2PIwqT6vBQt03b4gx3nmBSBF/BXRC35N5d7GnBRvxSHaAprqaYUvrHP39ntlC7
         SANJiD0RbfIKKi6EjF1M5JcN9OEemIKwiIYH0Yxin7vhj94q8TgqvDv+5ll0a5GbMN9V
         luUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010149; x=1794614949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TMUIa6NXZkT5J+VgXuQQxCc5HC+EqyVdymjHgA9IWOc=;
        b=OqkeKUGvHqqEaXpLH23KjnqWEsBrVB5hWnv3Pc9MpapWqQT8QolgJL73zEZZgnuTiS
         dOm0eHJrqF3GOZmUR0lVjfaSoKolmVwLLDLWy/+IKR7RxtWjeiuBOcH1xE02QIgxCSU7
         cITKf0PORJ2J6nn58lyQKXqkLzLWDezu7HO1KU6rGXdfIhpVZAdkxb89Cgokk/990oZh
         Ju2KXIuzofq9zUDLAm7aJfGbL1NadlvVq2h5EuFK0ah5kHVU+U3AmS9eyCPcs8z+TOhe
         hEZGGl5pl+jiuRhYz1VQCsteX9KTGb4R3NY7A/lhnxPy8Ou887Z9s/Jn+reNYfmM345B
         Li0w==
X-Forwarded-Encrypted: i=1; AKwUvBwma+bnznsLBRgq4nUWJG7NWWVhBrk9yYoqHhgbbNdZhPWj5ghVCrvnXgfsNh0DYKetR9/o/jvsCjVSGZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fb02cu//KfDfs6bkyJzCxBgOBimVH4KoMg0RWzN9+IkOKIaQ4
	jAgFpIT+ryBEuXANfTedBnbBb/gQlT0N/42kLtc+IMKQlTO6yRqaxWfzxQN56jS14V6AdbP0AMq
	WnEuIt6RsFDsPA2T4WmPb/iqyJU4KNFXKbepCREucF3UNqkLpk0MA8+2hoeg53lE5ew==
X-Gm-Gg: AYBFou1O0G77zrRQiBIvk1tj1aJLn3jwRnx+rxfh1msavJQYNaqJxDPxwxtk/xiLveX
	Mk4VlvH4C9nMiyxBlhVoFG7TKVdUmAtmpOeYIQyMs1QSlt5lmAJGNlmWzQKSuOKvVvrmdCBOcYU
	0yKwd/fu6LIvUg0B4XpgecwUOz5SjRkF5IGBBm/7pwc53WwLy7ccuIwL44svyg/0oouFa5/dSDy
	MoZOam42ZEJtV21lTJYqBL/iud0A4ob4WfLKcjkDGSdDT8knT8T+qIRTqWvTt2PiObBssVVM9s8
	JvDt5WqlaxzNQJc4lt9zuPEPiOlDpDSz7e2MIlW8T81ZjD1VAnCZ5Ccdgabp/noJ40TEkzKP060
	R2cIHkp9xYIfn8EZ6QLONj6kcCfdkuOS0n7aK7fttESW1mVJlfMrKHLQdAzYg/C2AP66NmbSZDj
	zhQkMXPkAgbUR7Ppg9
X-Received: by 2002:a05:6214:5704:b0:91e:8a33:6434 with SMTP id 6a1803df08f44-91ea98cd744mr56129816d6.48.1794010148498;
        Fri, 06 Nov 2026 16:09:08 -0800 (PST)
X-Received: by 2002:a05:6214:5704:b0:91e:8a33:6434 with SMTP id 6a1803df08f44-91ea98cd744mr56129316d6.48.1794010147906;
        Fri, 06 Nov 2026 16:09:07 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c4b8sm31998536d6.15.2026.11.06.16.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:09:06 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] gpio: convert to subsys_platform_driver() and
 subsys_platform_driver_probe()
Date: Fri, 06 Nov 2026 19:08:43 -0500
Message-Id: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVRi0m4iljQzjAWJR2EiLsrl
 l/y3n+BUhRSqLMLIu2iMocEm2fgxi4MZMQnQ1mUaG2BZlhkNrr1eqrxWDlE7itmhvRYIrEcX61
 pf6flRG59E3DfD8dYF5ZvAAAA
X-Change-ID: 20261106-gpio-subsys-d69c66fb9fff
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=734; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=E62Nm/ge0XA9LCcUxy5qK7fGKOdug8nN6icSr1xENfE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5Ui7/z02bdPtkInpnaLqHOckSuVfNNu+W69ns9t8b
 0eN879THaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExk0g9GhuVnRUwqQ47seZGk
 8Ye7w19+w0Xb3dp7ws/3TJvS9paNLZORYW4996ELbwVYHQQV3u9JPNok+dSw+/D96Aj/yUX/3P+
 YsQIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macros subsys_platform_driver() and subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      gpio: htc-egpio: convert to subsys_platform_driver_probe()
      gpio: tps6586x: convert to subsys_platform_driver()

 drivers/gpio/gpio-htc-egpio.c | 6 +-----
 drivers/gpio/gpio-tps6586x.c  | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-gpio-subsys-d69c66fb9fff

Best regards,
--  
Brian Masney <bmasney@redhat.com>

