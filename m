Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9537242D67
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187295; cv=none; b=ZftbsLUll82IaKfxISZYAktclgrZnQPRAwc457gFxsIqVyPCJF2UsdfaqBB5Mcyu/sFtaM91rsnmlkIG71398LujYM/CbOUKz1tyhZdEJCr9AsrrPRXeqfPg7JEPzWaB5swB5XsrbyF5bXjfPIcCVcLKb9JpgtbFl/MNfXQDu0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187295; c=relaxed/simple;
	bh=di8mf3i/tPdVpzKUjmNo0nIjp9t2rrQ1Xsc1TunfEzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBvOSPlrUwj8Deyps0NHWxYF1HOKaHGZHLxKnl+2WcPTMRwj6pWKIG67+nI8ob8d9oqeQ736pPzytzigPBHb0y+f5KQ2nCsd6udFpOYln++xFMSAV0O3rNn/Lg2C/lzZYuJoDSYQuSoiuMRk4zPSBOZjfXvVmruHfwIj8ire4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=GqqdHbHm; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="GqqdHbHm"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66fca0709caso418863d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792187293; x=1792792093; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XD17O/u/CjQvCNQRijMjX8N5qylFRWghJEmACCuaaIQ=;
        b=GqqdHbHmJnxgaHSddomXXwrD+FoSirzGwFIxPbcbcM4I3AXFmN2EBjrnoXYkwVdiK3
         4Ms5kgMcDrjZfNBU3gMF7eHDvlqQI1r8yK+XVDHH4NYHHt2k9IL1ejQPvu20isT3Btcz
         BiXEG4xL3rtg2LlZSWq3ePSEA445kXVbas8P0s5w7Oh8d1EdQGojaZE99IRTL9LBc8rc
         utX6ygC5GvhAepxW4/nRaICrfkEDaBx95wQzVlkCnXATAn21X2HYjeUz03zLl66mCo+7
         hSCJxiP4grRXxuxmUH4kGDzkaptma8WhZhrMVuOB9MaKJ7qGPPmTLR3B2B+WCr6buSG+
         6bpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187293; x=1792792093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XD17O/u/CjQvCNQRijMjX8N5qylFRWghJEmACCuaaIQ=;
        b=M/n6ff8flx/DgT3QhVw+b2QdeoZiqKpgt5Il+3ENZpbudRYhaBlciX0vGIfrNkgs9F
         bsaKH98/tsV6sa4eJyB110igJ3QHfzL8EIFWAVC63kNfqn+HdS/DD5kialvGzJ0mjiIr
         hGQ+WkPLS9bXBbnPz7MbGGuQjKVj/OvIP3QlTpQI5cNhge68pB+cpqXjSDgVU3rAwCuw
         d5nKEs7dYULuHu19jAVMb3o+ohveTK7F+p99Il1vSDW1MfcTeoZF3HVR9LsJ96LBsiIL
         urYbtnga49+qssZYmsHQ0YDX4j1mP1m7YSDM1+vKPRjl79MHnKoQCBwLEl53JMxxDVgB
         /qow==
X-Forwarded-Encrypted: i=1; AKwUvBwnNJxXWPNdvnbe9iVieYSmClX844VRxbklxo9cPOf+KUpnFz0sbltGS+FhF7N3Pk8dkMOp60EQop9EGvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHbLYzVV17LW49eYiqI4p7Tj8Mc7yG3l/MdLjk13A8COINXgCN
	M5prO3nAFr3mK1MJLIQE8L7LnrcKoIYLtwxdLFgaXgWoRq1bHQsBF91sfi0D3TV6wPo=
X-Gm-Gg: AYBFou16JeBIrhdj9OObjPB7L33jd5kngkOLjO7khJjAAhV1BHsUQBth/iFACf9zi9v
	ICJd4XhPo1DCiCj/86h7rioeLxXUmgpAjBY24l6y1TpDokEHDL+mNkKxXYJGVmas4PgLAKeRanv
	HnkI7GgGxc8HYr58uQIod4osnoSjP3PeDu06+rnWn5VnFgHfBur81aZlc7hEWPlMNmXPKRC9pla
	dUPGwzaR+oLgp3tZnibRV7fpRpIvEdcN8UPM4Me/QjrAIzSPacCrx/jwNMMqZvoSmbYfZFLo7eI
	ZlkAXFIKhCpf18wExtC0wTKvlRTn1Ag4+AjcD3VhsnXg/xsYg9k/ZRIW0Vb8rMUJqnqwLt4H7KH
	HPngdG7JH5vggQwLT7i2s2a6DWv8JKv6dumHntr5uFZ060SLwBsdhW3q60AybefYaUf3tpzj8Ry
	hHaLbcspVTHSSp/A1yf45bMeLzd/MW7UM8VhKBeTEUlqieA/AedH61SF4pAlHFp4prD5D6jI71P
	Hm9wFqEGqgOHHpoZndz
X-Received: by 2002:a53:d016:0:b0:66f:c1be:a66b with SMTP id 956f58d0204a3-679ca8da988mr177910d50.93.1792187292686;
        Fri, 16 Oct 2026 14:48:12 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1ed7cc0sm1598282d50.15.2026.10.16.14.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:48:12 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:48:11 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when
 available
Message-ID: <atKbm-EG7wCL0bpo@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>

On Tue, Oct 06, 2026 at 09:53:02AM +0200, Radim Krcmár wrote:
> User-mode use of XTheadVector requires non-Off sstatus.VS, which we set
> only when has_xtheadvector() (CONFIG_RISCV_ISA_XTHEADVECTOR and
> XTheadVector on all harts).  XTheadVector also bundles operations with
> floating state, which additionally requires non-Off sstatus.FS and hence
> has_fpu().  hwprobe reports XTheadVector from the per-hart vendor ISA
> bitmaps alone, so it can advertise an extension that is always disabled
> in user-mode.
> 
> Report correct environment to user-mode.
> 
> Fixes: a5ea53da65c5 ("riscv: hwprobe: Add thead vendor extension probing")
> Signed-off-by: Radim Krcmár <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>
