Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716294;
	b=P86Iw1gOnt+e3/JV7CwWR4A7n2Hb1MSDDs1icbqkqIx/UpCNvfoT4IQGhBSiUaaMJVUb
	 /9tQs2q/v0/ytNb2hREbUOG4Shb/09o9ci+MV7QXGdFWBg2xoBYVv13zs9bbpTgmT11C2
	 GXxLADnXGM8n6ceIn5wSJkVNzcYJK01OL8UvMFC4karidx4ZSI6s/gD2IKmbEVzvTqaMy
	 TEPj4ESahaC/QjW7Uv+z3+m4Wr5vhvWHsi463GUSSAYuyajHjXHt40YMxJulyWIDJ/QUU
	 OwZcaDB7RdsUJjuuTp3bHVKFV/HIZTHDv6FEk9VORkPrsPoYnOsHux8bGZp35zuGTLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=EKlM9iD6F1gyXy04opeEG9+C51VAWggNyeLVBX+b5pY=;
	b=4l4KH5E+jUAf2UxuGSFWVwtSYnAyDAZinXvFN/By4Wbwm0sTfPZ3eTNBXz7QP8ZTu3aV
	 YTi+tTzsDxvGQpGEZU5OI5AyMoyZoKInvmZYUwvtm5IgMrx0/6VmPyFeoHXZ1GfVuL6v/
	 EF2IxB9Z0Fd+wjYcRMWBYhmCwnXFXfIx7lrH0LKeDDNsXDFcNUeLU/018FUqk7duy2/pb
	 zRxnzKQBZsGVaAW11OFDldtx4IgTVRPPHnwKBOJWFBovNEakEAY3oPuTiw7io/YmNQ1oy
	 VJtZExe6M83t3jW88YO3duKfyhZAsXOx+fOYjBNQTT2IKkRSM+T5bBJ6USzTcf596Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jEkLpkXm;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0216085090
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A0216085090
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jEkLpkXm
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5954853eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716293; x=1794321093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKlM9iD6F1gyXy04opeEG9+C51VAWggNyeLVBX+b5pY=;
        b=jEkLpkXmCf5QOuqb5v1ryNkU59Z9axc6y+LPgVXqn75nefdxLvnI9LYBuxgEX+k3OK
         jWlTB0CljoZs3Ju/7VGouL6n/qkT/jOywJyk6r/MlSMaVM814/g3O1ET9E9GE8qWAPwV
         gtbkIQmr13hZ3v/R5R4zpEj9VMl+G9u6RLr9Duc3r7A5kWKYhEju/qOAlbj1PmrLUHwq
         fo8eBvCYLJo0RVGlgBqvYWnuigdY5halbWMjPePLQ6X7UBF9W5dZHWyA80Z/vcWXsuh+
         p4FMnYC2Wa2yI1mFI3KFPPoBL0IzJKv9jxBzuYMHSDOY5rtJJZ3ZvkPs0PrssDALyez5
         gPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716293; x=1794321093;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKlM9iD6F1gyXy04opeEG9+C51VAWggNyeLVBX+b5pY=;
        b=tyZYGLLujSqZlu+IHm6xBNNb5rrVt52alu8qgVoM7UQRSGymIEDPqYl4luHvisX7YP
         NH2qKW+/UILcvoQ1wsP/jOqdqSOKIxmNO7QNF+ohEGXD3rouUb+3olyMHPGMRqh65R4N
         w4dWtUdqNosnWH4Q/brNMyGV4Qw9GVrz+QkOVpFVGujpE78a707w5LyEXPtPFkKeFtyJ
         L6d4jnVpuEygfonOpJ8xOvDueeACOh5WMAq/WcqFLCoI0Vx9tT+VBt0JReKUzZo7Lo7z
         AINymD35flTQcuvXgvMOhEfmHVULhN3dWkbwWljryaWY0yIenUTmt6cfUd2RUOVn7oNE
         L7ww==
X-Forwarded-Encrypted: i=1; AKwUvBybD6P148h3apFHqtvl7qWHFCYmJ/pV9lHRFBe6v9jVu0FydgQ3UBd90ijG488Q4JMFQx1MNyrFqPRfDRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6dTt45JYl+0DkQ+Xxmn3RWzKAJ/qh6Td18HETucHshn/XWfmX
	V0pB1i0Q9mFuQ7DQn/MGaQ4UD/cdShhKaC6SWWt/fx2MN11S/7mQtNw33omIVto2BGU=
X-Gm-Gg: AYBFou2GIq9yTE/DbCUdPo288gsrZgp6mY1TEHuplEgdslb8j3TcKtM8dFXOdrVXH2W
	TUlZg4PNxO0V7dsDDkU2h0Yqgqy3eRGZ7y7hByp4Tyaer+BnUnR1VHYTVEOHdv/L/eajOq8VddU
	Trh/Mwacm7Pm1fCC1Z0yPgfrHvKJb26YaOeZGAjDyPiqur6TGafv/p4qakrvyV4HnoGJ8GurXCI
	OuKhN2Rf4Af2olUOgTlYfqPDTiBZ+u8M2f7Vr3On+JogpC7xLVXj+GXFhN4p1e/NUkB01GTtLHJ
	DOwdj9k8zoUSqYr8qskrvvuSTqer+M+h6PwkQrE1QRTiTQQiUi4Ni0imr+RL9CRxsB13FntJiBS
	X3YSp4z9PkDOYErJ3CtaXS0w0IfrS+nZmrP6aWuBuQMoRSX/F9Ijso/tCtC/P8R2MTW+0c7kaSY
	3Tor9rPikDh4c2+hPs/xwRk3FKMP/k4HjTV/keHZLojBROY4w5GDLhIDH1rtMrz/yVIMvLNdO0S
	4WAXlV1eIQgx2Yuq3D0q0DTsLka7nVpWY9SDRbd8Vf/nWjKNU/yL4T56Oe/q9385kMXXlUJ3FEP
	O6MWsklfqT8whbEWNNJ5P0pZQ/gQ/OON8KAoErFlfYcct5zSlWIMExxTOenT+NMym5HjYx0FyBS
	3NDlNUN1UiYgk
X-Received: by 2002:a05:7022:1706:b0:1ac:7044:2bad with SMTP id a92af1059eb24-1ac70442d69mr16914729c88.36.1793716292497;
        Tue, 03 Nov 2026 06:31:32 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:31 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: mst@redhat.com, stefanha@redhat.com, hch@lst.de, 
 Sergii Ushakov <sergiiushakov@google.com>
Cc: virtualization@lists.linux.dev, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuanzhuo@linux.alibaba.com, 
 eperezma@redhat.com, pbonzini@redhat.com, Jason Wang <jasowangio@gmail.com>
In-Reply-To: <20260918135120.1261150-1-sergiiushakov@google.com>
References: <20260918135120.1261150-1-sergiiushakov@google.com>
Subject: Re: [PATCH v4] virtio-blk: clamp max_segments to virtqueue ring
 size
Message-Id: <179371629139.3691261.5658135029894981037.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:31 -0700
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
X-Mailer: b4 0.15.2


On Fri, 18 Sep 2026 15:51:20 +0200, Sergii Ushakov wrote:
> In virtblk_add_req(), each request consumes 2 extra descriptors (out_hdr
> and in_hdr) in addition to the data scatter-gather segments.
> 
> When a hypervisor (e.g. QNX Hypervisor) advertises VIRTIO_BLK_F_SEG_MAX
> with seg_max = 1024 alongside a 1024-entry split ring (vring.num = 1024)
> and VIRTIO_RING_F_INDIRECT_DESC disabled, lim->max_segments is set to
> 1024. When the block layer submits requests with 1023 or 1024 data
> segments, total_sg reaches 1025 or 1026. This exceeds vring.num (1024),
> causing virtqueue_add_split() to return -ENOSPC and permanently wedge
> the blk-mq queue.
> 
> [...]

Applied, thanks!

[1/1] virtio-blk: clamp max_segments to virtqueue ring size
      commit: 603e66e8dd6adf2bad54bb27f4b690eacba3745e

Best regards,
-- 
Jens Axboe



