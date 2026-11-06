Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965687;
	b=ovqdqf6gfpRr5rtSPEr/vjm8opi1Roudlp42Z8ynOUgqeb3t7G4jt1XispCzMDYbMWj6
	 UhLYW9R5Ze3oskpNGeWeC5Uy7yE2dNO6/0B+CX430nzPeDjy3mnm5AiQpxi9BvglQhSBc
	 KsblzLElzgnN/i/p5iREqpHnXRa0lG6xrzrXvu73YlLk2JEzpFK+W5KUdGLkm8q+W6GVs
	 hBhPD3kGrwdqcDegi4+fyScpyA9bRO2E2nGhsenI19Y1YQyHBXBdOGw+IPBFdsCQhlORX
	 5bFeSlTOFUCqzt4WDDFay+YGSDVdnytpMXU77r9h6jCLZ8EW+F/ycXe3Lb/yxjRKzEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965687;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2Yu0+6yyRJOK09C6VPDdgbU03joVf17Ur+yrOL92GCs=;
	b=KdrXK7CAfReWeIX96EriSh4DFGjDNFU4MXLPpTRkMhDeLUQPDIMt7okYrBzXPB3SEYKL
	 8WGJ4nqUmELuIxKSx2I6UKmK7W/67F1vO6eXIAknjNZ4hKQAn97FvEHg4wK4VdqkyUP32
	 AyTyQEXnHu6bGeSS3ipiPMsxvJjEyslN5M1Jwm3cJbyGqBEFVwNlH4gX1LjDUDqZJ0WRr
	 /5H/BYiXERDdbyAsXXL4kQ6DaxrVISle3uXH/14DT0dSs1QaYXZtW2gAyyB+YCukqDezZ
	 kuj0tp5SUmZc1YMJ2Rdt0jN02Gdk9ixz5Jpj4gCMjZ0g0ohY1H06Xy27QQU1rPX4BjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=S2QXcn4R;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="PR4/Dmfl";
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E045606A92D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E045606A92D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=S2QXcn4R;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PR4/Dmfl
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 7A7781D0019B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:48:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 06 Nov 2026 06:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793965683; x=
	1794052083; bh=2Yu0+6yyRJOK09C6VPDdgbU03joVf17Ur+yrOL92GCs=; b=S
	2QXcn4RT9dWI2zlFvAypefz+0IYHq3oU6Oi6Pl1tzpW1AeLstop83UJQgHe8yEOn
	dQqPvW9+ZE6SmrS327Gm9xpsEp3lOdHzAzxArFZtB6jJf7xPoySSOtapYuKmkgZR
	5gTzxhHO/+5hE1oXVLZEZleZ6Of6tk3QxC0dJfr3OGbqqrJsVaVfNqaLEQN07VVC
	5Br3g0MAlYt3rHJH8kS7zBxvrTdEncSgYrQCsPrK4vaHnwVNQyNoQ0nLjq5Cq+Ew
	7Wx0mgwFUuhLAEygJJff4S9Snmq0VI6ZXTfmDqiOp6/xFFaT6I4onc8ow0p1Z/r/
	cuSyT9+mhZiLqrD6orVJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793965683; x=1794052083; bh=2Yu0+6yyRJOK09C6VPDdgbU03joVf17Ur+y
	rOL92GCs=; b=PR4/Dmfl8Mdq1TS6LXKLCUfEl7iCen9pfMVgRSbZd6CwQQhArr9
	A6nVYXmGzR+J8O9aGqJLeMZ7xRlovgfNjIFypxqV27z6sQhZSe79O8Dfi1mDfj/H
	yB/gOmAT83LP2QDy6Bg1fFvFvZAp1KylilQ+yUA2ygRLZKItk/YC0Vh4+cmJxKSA
	06ZZNCL29VPU1CrKHAA5iBME7/npMZ1I/+Mpb6Kn3jrxfIG8saSizvZiHqO/f82N
	YozAwc5YroZHEr4jBhhDcIgcYKg1RhURwJRM5+1whvrIbNV5VeHwZhWGfQH6JhZL
	2BtoRp1RIQvE5mfw+9ut31o04KJQCZaFBAQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793965683; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:Vbc5hfhCqIy/NePhSdmVel9d7DhiRCIj+b4gGt7BvWCiLYD
	ZvzYUiSeNz89cSolVnf2rqepOQJ/5CO36NscIxG7T3+UoQR7eBAHx6RNqObm2FP8
	ebSu9E2n7oxxIxO57kMsnGcb/CxfR6XubOMsU4llEmvz/AkCA53XdeOcGv1YQ6N/
	wdHDu3btKOLFn6aom3F7gZiBx5l+jYF34Vz3BttLnJe+qSIqmm9QIgYCKiKMEz3t
	ZSeajJ1Raj5chDRk5E4LCe4+5DPOoVyt4z7R5B4UkNpOTmQv6KVrlotwcBC6/WBO
	LaH+pIo36hXZUT8UcLEFhA1kK8PNGPvCQ1U3LAQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:FmEDi1WRQcklZBu57Cd/S7wSjHsUwH00f8wV7s5cSYI=:CAwZkgiAf0SgLFydBf5LAB4mhQO23W7Kk0zf8AYfp0k=;
X-ME-Sender: <xms:cr7taphnteCOd-mfnf55XdPbxsN_wZBVDEC32FieJWcOMQjrGKC9hw>
    <xme:cr7tahKuk8trk2ZTlMfB_M3hMe_tMcaMx2HAuPmqwdoMchKffWaItAvRz1JVlWkjQ
    meh-QJPbCHp2Z_y5coZ1IPjLy7n0DXL7wLQ4ENVLuRotv2fSGuR_ynQ>
X-ME-Received: <xmr:cr7tamjbHZUSTsk5BXOqJ2KZtfMJ_Qv7fITMTlS3VwatxlIFDLqAMYcuNGo>
X-ME-Proxy-Cause: dmFkZTEiP1kE5K2AjXPUGYL4V08xpaDYMmso/I3ZYp5NQ0mOY8VtVcT+3RreC8z2zSjnIj
    8XGwylpC/E32VYxSND/PJg3iKj4y3As5QXupte01kfviCQF7g1D7gxMnAOjOyE5Zr+hzkT
    33xzjOP2MI13X7E4Y2Qf+9hmgqdREAwWEz/0c0FPFkZWREY3jPnfv2WCE68RdEfW1T8RfP
    vMasPkCAbpQwmVYnSxS4JTGiRzx7nS85KyizJXI1ZMlj1eYdiB1Ebv05Ea7TicR2hLANIL
    JEOaLreHdqcIPuW0axq0aDWX+VvBCC8B/Rn1sPZh+0wSMtKC2eo1s2lm92ylORrXCYf+Z1
    DrhceeY7DzK6E5Cx6mrw1O/0ss6gQ3rwUQaH4EM4Cuhg1tQiYQMtx+E+WYKn+8tw4GD6T7
    lOp8h+EZHmw8klpYGZ1RS1MPj5cW5F3GJ9cnGT2Hbijz8AMOeOZqc6Hh62oudB/EpuFuJS
    RB2mAihyoWDGgnMs2Wzh7tFD6nLFs3amBnW6mDsAtkMEN/2OYz2JtSU5Qi70HwMnOoVGvx
    mUJaVahLbJ3AeGFzzUa/PiY2CXW+7yKKaIEUqnK/8hDh928QFJXf7Bx+BF78b5bDvxEnOr
    ABjbIOsAou5FWBXBDhn49M+D2occqn2qbKwnjm+S4uUIvP0JYtuIwOrptuEw
X-ME-Proxy: <xmx:cr7tai1a2NN1Wfb-8gnJU_CtSMIAYzG2Z_e2CFXKzK26adlsy6LWCg>
    <xmx:cr7talYBfPY7T7JjORebcD4YAd90QwTDfD1SrdvYnUHkLEqX4Zqi-w>
    <xmx:cr7taii50ihsTw0GtDdOjV244lhz_F0L-b5tSl2qFwsKdcny9j4tvw>
    <xmx:cr7taud3JN8H0iC_0FrE4G2qMD6SKoUAAT_UvNhgE08sqNPAmqGBrw>
    <xmx:c77taj2B3ADjw-KNQp6DSH_54H1PPdDXS0Q0xro1Y02FnjXsyqoiCs6P>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 06:48:02 -0500 (EST)
Date: Fri, 6 Nov 2026 11:48:00 +0000
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	James Morse <james.morse@arm.com>, Usama Arif <usama.arif@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Breno Leitao <leitao@debian.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Ada Couprie Diaz <ada.coupriediaz@arm.com>, 
	Vladimir Murzin <vladimir.murzin@arm.com>, Linus Walleij <linusw@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Huth <thuth@redhat.com>, Dawei Li <dawei.li@linux.dev>, 
	mrigendrachaubey <mrigendra.chaubey@gmail.com>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: sdei: Run the event handler on the kernel
 vectors
Message-ID: <au2-GegBg8kRmBs0@thinkstation>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-2-kirill@shutemov.name>
 <auzM-l40BLsT3clg@arm.com>
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
In-Reply-To: <auzM-l40BLsT3clg@arm.com>

On Thu, Nov 05, 2026 at 06:37:46PM +0000, Catalin Marinas wrote:
> Worth a separate patch to fix SDEI handling with pseudo-NMI on and no
> changes to __this_cpu_read() above needed. So, for this patch:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!

Would it still make sense to switch to raw_cpu_read() in this patch for
stable@? The splat is new with this patch, so without it stable trees
would also need the PMR fix.

Let me know if you want a re-spin with raw_cpu_read().

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
