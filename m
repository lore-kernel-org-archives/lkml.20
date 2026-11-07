Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047815;
	b=VMgmKxKwDXgOska3DW8hrXf03Xl4ZAaaQyRC1DYB1VlbDuAVSo9PQw2vnRFbvJyuuQGI
	 aCukBa5BEumm4u1coVRwyLk8d4Vg08NKOPw80yu4iMvdPujHSebyJbghl5o7lf5nHTpru
	 8Y0hFtZDsOIC+h7amykp+zlhjK/IIUciIwGgrFwNV9mYQEAiDfIrswMxC29R1vgyn1PCY
	 zVX4lM3JZMFhNbI2usGgQb/jXU3FWr3gMg87QnABZWG+KUzHUJ5ncFD96Omuq84d+Hu7u
	 Kx4u4jqRs4uK+dOIXbKPrNCRj6Shj1DDpeAbA6R2lLbGvtSc3J7xhnbKy59mY9Xw8+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1oiBZxzIQ5ApPwvupFbx80Jl2NVPJdhtgfzXDJp+rts=;
	b=R76o6uElZ+VmbNMX9+oogDciuVDl3bq6f9psh5b7bhv9RPt875ojO8siiWOF8lsJr+/x
	 wZip6h8JkPN4Z2oYs8424FaCtirUZbtX8RsejlI7K+kEtij9DxP6OijlWl58bNqK71bKG
	 75r1png0ZDSCeeqP3psUi4C+nSArTzGOb10uFc0GySRlvlNCvQdRjjH0X1S1PmKH5JLBQ
	 e/KUy2UdvLVEQiFSgiyKJT/z+of2nTlZ0qaEX7sstiJepSCZcalfiV0VkRHneaGwkYesE
	 9MIblsh/RZkCQ5n7AAJmUHYw1aFITxII5ttU1aO+coXU6oKIcKezgU7HVNT/VsZ4Ylw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zx2o+D7E;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E7606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 537E7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zx2o+D7E
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13464345e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794047814; x=1794652614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oiBZxzIQ5ApPwvupFbx80Jl2NVPJdhtgfzXDJp+rts=;
        b=zx2o+D7E096nEk1R0oFi5S9dE5tnH+trdZ/fJERPVfmF2gjz82jMM7SgxkyhvBh3+9
         6B74ahGQmhPfTUn4KJXMGAlli0S9ld6+u2i3tLTK7yz7neDSJ1GMOCprM+k/iY2u7qIW
         /GN5rRG3r4+vS4gAclriM8hzY4i3wPSjO9mxTxUfm9tfr4Diju2WJ4axyU8R9T96k8Vr
         /4WLYnresYQMK+Z3PLncnxrWoKDdYTr4PuPF4etRU8tDhGJQziVD+En/FOM0Ycw1LwgQ
         JkFG5yJumd3IfA254qVBJR4inUcyyyJsT6H+YeTbbereMJGMPjpjlxzzfap/OBXD5EGn
         ccGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794047814; x=1794652614;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oiBZxzIQ5ApPwvupFbx80Jl2NVPJdhtgfzXDJp+rts=;
        b=W2HnMoweRlmopbc6lxvCPfQPc/iCozzwsox41hJhqcWr/g37QxCH1YsEKvyiFwihcM
         9uPfaBKRqVJaU2E455316v5pivR+wpE6sO7fsBSPAbkECY4Yt7x0RUzvxmQZQsFv+201
         0X96aDuTzlUL1FPzgenSDlW/XTfVwxnqingQ4ZbjlaqhWk+T2q4OF5CqRfOJ+EGObpBR
         eyLkbUJziIWudrxOFBbZDdqg4yYt9JK8bl3LgsN69AIb0tXX6XW0L8QWGKQQiqUEjUE7
         TjpVsQgGqrjHcWICGbUWLumPhIWg/V7vS1d4/t191wAobKDR1w5O4Pt4CrC8mUSlOim1
         0f9w==
X-Forwarded-Encrypted: i=1; AKwUvBwEkFPPViHDF+ff2NlIuji6qiDkAnMwHJJNjYIkFk7pa83eWCcqC67K8EScabbTk1nk7wxnPhkumpCSfSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DpGvwLoeq3BrTfFmO4HZeLvW7LzXXUOcDlV6pCk0vFK+D05Fl
	0Uev+TmzQ6nXyBUomSG/KIIvMzYMSRRD/Qgaz36IS/+j2vKVh1CwoktE
X-Gm-Gg: AYBFou3S9+eMASdvJPA76Kn8/qb+WISkpAsIt3abkveeIiGSBBhx5zniJnKn/cVtFRg
	k64+cYinigE+yvL91svmDsYK6rSH8rtNSCCe3wNY/yPdfFRzDd8cvqj1/EdxG43ZYbRmw4vFNmQ
	o8f6Jm4Y7Mjhap9fXOz4E4XLFsLY4VbErZJOZAVIMHm1DMTBq2Cb/v37ieH8uxLWpwhmyGGoA3M
	ItArr698N2b2MmYPsKdAyKStjTY3qt7eC0trlXF3sVCgjru+lLtiPonG+qBY0yhJoAFVmWPZGGA
	5Ckr4wOd+im4TPr39hR2wbiOyg8hRxrlsWnJCjt+RNxmaHU7HSCotyNdbrakmOVwy7nAc9feRGE
	ujRdGciDojbf4J0Sh1zIWiCF7iaFlk+BE6xZibAbA87sbBe/2BcFnMmmx4CoB4nfn5GWwsnIUqn
	SfVut+9Q6FIjOKhbLVTfX2kFWwxYbeLTaoYnfh6BD4m4Yw9nuGOEHXGgAGQJLGZJjTIsFofaJxa
	yZXv1MRQG4onpQqwtoccdNTFL7GVurKhuNpWIGth3b5szQF4ksvdj7N7Z7OaAYxD5NUAfM7VBGF
	kuCv8ALFg1RewvS3DYU6w8l0k/FEppZA4y/vLUsRggXfHM81QtuWk2oRqJ8XvSe9y2Ef07jmsOy
	RP6bpOgbBfyRV4V87yHM7
X-Received: by 2002:a05:600c:a013:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b6df5eabebmr88206095e9.19.1794047813611;
        Sat, 07 Nov 2026 02:36:53 -0800 (PST)
Received: from meven-thinkpad.home (2a01cb088745e00090de407b41070a01.ipv6.abo.wanadoo.fr. [2a01:cb08:8745:e000:90de:407b:4107:a01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795038782sm42289845e9.3.2026.11.07.02.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:36:53 -0800 (PST)
From: "=?UTF-8?q?M=C3=A9ven=20Car?=" <meven29@gmail.com>
X-Google-Original-From: =?UTF-8?q?M=C3=A9ven=20Car?= <meven@kde.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] HID: logitech-headset: add a battery driver for the PRO X 2
Date: Sat,  7 Nov 2026 11:36:35 +0100
Message-ID: <20261107103647.1196629-1-meven@kde.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <V4-MESSAGE-ID>
References: <V4-MESSAGE-ID>
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

Hello,

For anyone who owns this headset and wants to test v4 before it is merged,
the same driver is available as a DKMS module:

  https://github.com/meven/hid-logitech-headset

The source is the v4 patch, with the two USB ids defined in the file
because hid-ids.h is not available out of tree. On Arch Linux it is also
in the AUR as hid-logitech-headset.

The repository also carries the udev hwdb entry that makes UPower see
the device as a headset, which is proposed to systemd separately:

  https://github.com/systemd/systemd/pull/43737

Test reports are welcome, here or as GitHub issues. A Tested-by on this
thread would help the patch.

The G522 LIGHTSPEED (046d:0b18) answers on the same vendor page with a
different frame layout, so it could be a second table entry in a
follow-up patch. Nobody has run that on real hardware yet, so the README
asks G522 owners for the report descriptor and a few replies:

  https://github.com/meven/hid-logitech-headset#g522-lightspeed-owners-wanted

Regards,
Méven
