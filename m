Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF12E3CC7DC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789887226; cv=none; b=bQnwoeiCnVC46c7hEFOC1uKwim2JT6MamK4gGZ6CYhl2gbYS/WBRXXckh2lNBSIXVn17qwJqrxoRHyyZyB+gz2MUNw1AiEVrZcXYNGkP/DRCVb47MXbrhqyAfEfhhnxETi2VC9fL0xE2NzI+WBoBZ1CLfjKUx+dDKFl+bvgeHNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789887226; c=relaxed/simple;
	bh=DuDZSD0XqCu2Mvap7vNOAj3dgSNFUKZHYo7DpbnFTAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDx4DBFQ/xlwxDSOEdl17sim9vzqZF5JfZ8K1DiwX8GtrQ+OG/sZPw+lPxDA84qdS9R0Ce0lgQqRRyv8uo/GpGwmQc1Ax15/uUQbJNlVzQ8M6Y/OKBuvxYk3YR4RFc+AFmI/Oau2GNQVAEL3aahmJOlcJv+Ugd7p5CRCfGQkJ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAq/uUIG; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAq/uUIG"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffcso15295305ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789887224; x=1790492024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuDZSD0XqCu2Mvap7vNOAj3dgSNFUKZHYo7DpbnFTAY=;
        b=FAq/uUIGkNHWEdLttX19mcV7zrPs2jqA4x2IDvONeIzdqRTeV5g5DSDpoAD2K6hKcT
         Aw7eYt3XQo8lHAUB2lqzA7fxOF6jqwwqIHlvSWi0t19jhNzE/BUX5URVVj8tzp/xzbmR
         Mf1bcdEd+cufVmHLEgXcGRf3fkvX3VzC7PWF+hjDBgxzYHqW/Nn1INroEumTllGPs7nS
         KLyhreous7FFST1U4Cw2mHU7FEa0+a8wijnOibZkrv1s68/ZO8nPFITSO1Pz0BhS86jC
         7a3J1tWiq02NypXLF4Z8FlGal1veYsmew+alRh4d1/9IxBzOaG9sWREaIbV0MLvSqFgv
         JJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789887224; x=1790492024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DuDZSD0XqCu2Mvap7vNOAj3dgSNFUKZHYo7DpbnFTAY=;
        b=UMPjyTza0RyZtrkaI4dn0QczSPPApWSX1D3AQRx+r0SSdFN0RvJhD6lRR55IMDDnLx
         +kpp45GmAOnBT9/kgLftAhegtRAs9iBw+z2fWSTCtGJ8Y3njfictE08n5w3NLwFiGm0w
         Xv3D/7lx95P40A3R36CY1iMCQlsbFWzO6OuX7wU9JrysAY93UPaGIv/Ye0yV5y+Bte+0
         LBNqjnkQ2+WTqBKYv5J5/IQCK/cWppTZ9LYY446yKNcFCSJZeMqdNcqfbGfb22ozdgan
         W4BQt0LpdOppAtyIhoGz3u3zvPvkMGsDR631g8I8Lsifr/AZWprzRBGhpaUtnYLbsB35
         uYtA==
X-Forwarded-Encrypted: i=1; AKwUvByNFCjJJ3fcSXSj0OD/ViALqmFXNYZCvrMdB/+oniuxlQi6EOkZwnHsFIJpozCfJQsABjlcLZuzPnoDYpE=@vger.kernel.org
X-Gm-Message-State: AFuF++lKMIRfr9Q/PxP3R8Vy9PsfyyM2YzuinPAe3I/yL1+CXM/iuo01
	Rsd9qa6kQiFE3j0chmEpeO/KaUUjgiEL/riX+EKTLTLt9XypZjm5Yo6l
X-Gm-Gg: AYBFou1gabcWCfL3krJbeU192irHu5anjVzjEZdyTz3w9yRayhzHSYCDhdKBv2qwLlW
	5M8koAuC8hybjpA9M7vGb4pM11JmFeO8OyDJ8v6j/u78TlsTTKkkfm9A3GDOqztoJToovSMc1oY
	VVBihvMz4jKrmvLFxxNBgiCItp1156rFwok1eQN6ZlOw+vFqrB9T3i5r3Fg7003+dZu1UIApSFB
	rl5nT+eLfo6JdG6BNV7tE63ixS/1jv0yQdC1/NUR+Ftz2m4E/DvyAG20p/tjJo/9fkvn5ivxcuT
	ndcAfqXZPlz5bRxBI9P3hLZ7U4Eq+zpgXLYdHSdosU6NSUTFWfNaYdz7g1+v0CF/XXFtZm961Pq
	YRMnac7ZtGPeYOZehMXcd2RvovS9cPVlN+1895o6ah/gDNlNgSNr1FmwuRpAoo0cln7Y6PeNGms
	T9nm1IgLLNbrSzA1UIP6oy65v7vrENMeqD2CY7blApdiowV3IpMLaZHJnNZ4wrhrM=
X-Received: by 2002:a17:903:1a8d:b0:2dd:c100:80b9 with SMTP id d9443c01a7336-2ddc100816fmr59583595ad.52.1789887224050;
        Sat, 19 Sep 2026 23:53:44 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179ddbdsm17296615ad.35.2026.09.19.23.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:53:43 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: xu.yang_2@nxp.com,
	hataegu0826@gmail.com,
	christophe.jaillet@wanadoo.fr,
	Frank.Li@nxp.com,
	kees@kernel.org,
	felipe.balbi@linux.intel.com,
	ruslan.bilovol@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liuc63@xiaopeng.com,
	liuwb@xiaopeng.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: validate bRequest index in generic_{set,get}_cmd
Date: Sun, 20 Sep 2026 00:53:39 -0600
Message-ID: <20260920065339.52062-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917081832.187957-1-liuc63@xiaopeng.com>
References: <20260917081832.187957-1-liuc63@xiaopeng.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 17, 2026 at 08:18:44 AM UTC, Liu Chao wrote:
> Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implementation legacy")
> Cc: stable@vger.kernel.org
> Reviewed-by: Weibin Liu <liuwb@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

d355339eecd9 is just a file rename. The actual origin is c47d7b09891a
("USB: audio: add USB audio class definitions", 2009-06-03), which
added struct usb_audio_control with data[5] and these two functions
unbounded in the same commit. That's the tag to use.

Fix itself is correct, I'll add Reviewed-by once it's reposted with
the right tag.

ivy
