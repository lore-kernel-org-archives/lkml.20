Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562444;
	b=fmps90sO+HX54cIdmJO59uDL3Fxg/laRP0Jtf0uDSapP4GTYBDBdOrRJgnHcLygUocmt
	 dKJd6bjcoqC4whV0Y0JtfRQfMssqUNqNGyEoIxiQfILDBiuo/MIGvanxclWdrMM+3o37T
	 W/3vPOnEobeYgiFADTdilZfPxf0AkePmY4LBuEjlv2IPjCJzFWdq4++PjOKyh33wY1Tp2
	 TtgzyH3HenyK3fgyZCfICHM098qZseIaGXPpduZI/c/WLRMGkpJVETwWBF1Ivs8bXLKko
	 s0iKFtXVJ/O74H5hbF9EZwx+vqnwphw3ywBLc0sAmlY/E4oblob/xr5TKy+iuF/YjnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=379vudG/WJb02QEPDhkwYSsj+ty4CkjzG9JneqxsqDg=;
	b=ieL6HwhtOHYck6KHd/UZKDA3ujSfoAzz89lQdAfr30fagWzUp7WWTI8uWbdpxxOLYZs/
	 PuZNo/ViEQbkdFGvSubJu68tAizBylWBQjOIogXr5oPE1iw254hvBhpjSJ2Gwyzj8RbqU
	 w2Eff20woGmd8CVk+/s7cydfbd1DLfNBbRlstrENbiNHDRyCIvBDPA6naWESK66IUhBjB
	 9pAOjP/sKSAwUhIO3tQx0H0BujGOFp6yPsVUTpcaNqXfBHEWjIlXSDGlr/coLnGHik6MG
	 ZTK/hvVwjhAzemhvpyMGWkbzC3I6JZRRisttdU7bdvNVFaAZbFjbQxe5r6IjjRZXIjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pv0Xfoa4;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC8C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC8C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pv0Xfoa4
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c45551fa84eso35852866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562442; x=1793167242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=379vudG/WJb02QEPDhkwYSsj+ty4CkjzG9JneqxsqDg=;
        b=pv0Xfoa4jWODVLHbQe0xeNu1lcHCdPGrnNah1BsEt6ecroFx+3nLvwZGugIa6A4OB9
         bGT0NX7JKTiqyXdopTKHeaAjXknOmX9P5YERi2qJfzMXOnUGEC4PrvvQjR4M3RHEOnHQ
         sZ4Iv8WiIW2pKpey72uAGOU6E8XNZb/k7nrgzWvkqmR8SpFZESOCm1NQkwco9+ck9iCW
         +MOLQBZHx/rPeH9Ik1AUOhwfRYPxXiJ4XBYpIKjS89k+Z4hQIEQEGSyhRPkpQWxeWHW3
         gCThUo/AVRJfqQI2TaXaibFOg2+Zw2+okLrDRNg0dBTJNxaYz5lw4qTe60zEn3F6k5oJ
         +fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562442; x=1793167242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=379vudG/WJb02QEPDhkwYSsj+ty4CkjzG9JneqxsqDg=;
        b=KUW3+ZxxFpd9bxK91wUD7QUOhKpkcrYHWsBRkJlOQ/nTwiD2z/2+pKBCLBfqERVMyk
         RESbw+mnHYCDiV6JaSbv5UzkA3D1jbl3yN+VYTfgBU+7sXYZukLHRq3xbK9zgzYtsHt1
         PHezkNyJdRsgfdy7lOJjpthbZUB+nCGeOR3g39B4U6PLlTvsqPXoM6le2lS7XgaJcZqG
         OV/vsrswAKgdCdTKjth47dsnPYkw0w8AeQC5FegZHeqDsAfQDyH4X2eMhFL4dfQbJGoe
         Hnpqr5Y67U0wES7MHNiP1h8Yu2N9S5zoiMz91BCNMGt6o2v6YHDoxxoF5bWepLbNr3r8
         odxA==
X-Forwarded-Encrypted: i=1; AKwUvBwbjIB57YKAPS53yzJ6xiFQciLji+PSE2dRn0QsRg9pKKM226YMU983MOT340p3d+fABmkmHp58NTeJSjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOvYJn1k/X5mFAXoEwWVulyUtQNscVB6g++RRH4zvzsIqBYt4A
	k42sxaZH0/2T1G2xQjxvc+IJp0QjmVhfh6GqYsWpmouBlvgoBQytvh02
X-Gm-Gg: AYBFou30Hbs/1/a5ow0WtoCzfcrX2UP8RIllQ8k8P0XVb9KOWwtGfqrur9nawhEJIBq
	+iBp3D2wgbJGY95JaulMJ7a8tVaY1PhX2RjnKuYqEJqEfMKDV4ffMIE2ykCCAgzxbG+sFDpi6d2
	DbSAb8Nd9w4ZLhzzU64tEFMpQpXcVIcJDsR6USHkgS2QckOF53qlZuL4CjviBQQQi9B4IUEuB+r
	8UwoOC21qwKlG2vd2Y5hCS+6HOvJsJeLZcKaHUFw+8kBjdOtQQIbtq5W+OER5Re/4G/wWkM1mAc
	fhlsoRMUVo5Qa9vWoGLVvpmwLQjaB5GwK8sdQXS6lCJjSe9JW3gXuk9oe3riQOR/QiEJvHG3T1q
	+j1AH5ryerAnTqaixs73czd9ccz3GMioFBi64N9UPxvuoKxWptBBd0fj+YiQ4Q/Sh8ntRmdMvNP
	sPdAU7v/y8vtsRUnI86BiSzjbhRAzHOZQGfns0BnygjUilqQ0ClnAfp6nYxqNNZSRw12VZ1fjlC
	rzlXji9X+B6CYxE1AzRSftDlMAQ2Aa9Hy2KhwVZGy0wpt6BlLPF
X-Received: by 2002:a17:907:6d20:b0:c3e:d2c7:c530 with SMTP id a640c23a62f3a-c467953b76dmr98763066b.12.1792562442454;
        Tue, 20 Oct 2026 23:00:42 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679005594sm41116866b.76.2026.10.20.23.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:00:41 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:00:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix tx_fifo_depth underflow in write
Message-ID: <athVBXsjmZBvR7eI@stanley.mountain>
References: <tencent_8D0F8B2180750F84AF2D147AC203FEA9F406@qq.com>
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
In-Reply-To: <tencent_8D0F8B2180750F84AF2D147AC203FEA9F406@qq.com>

On Wed, Oct 21, 2026 at 11:29:08AM +0800, LiuJunyuan wrote:
> Check fifo->tx_fifo_depth before subtracting four words to avoid an
> unsigned underflow when the device tree provides an invalid depth.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>

AI loves to make this change, but actually we trust device tree
information.

regards,
dan carpenter

