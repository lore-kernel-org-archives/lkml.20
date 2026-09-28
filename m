Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B7C4E780F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610410; cv=none; b=PMd83EC/kSNSsZgsDNKpJFZ+uCGaf8X1QvNsmzMGkC4AEQXGORb2SLNhsgn/fNKqhs4stA9avijGY/lXsqddpHd+9XJOoYS0d/XU9Ifu5ViPlzKRTe1JHmahk2R7DitCqbSSaL1SIUw+z/S/hMhxI8xKm+RCMzyewqbjM7tfN1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610410; c=relaxed/simple;
	bh=C+IjfTCWUAOVxbfLUyp/OmClI+bARXJBCrhUJf/amWQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KLXiDfOn3QfbgR9fdW3Q3cuaC0J6d+ZMy+wX/KaNJIEU5YZkJZHw07v/eA5TSQwc+iTdTVqSgkUTuWGvqlwnx6yDHttSgldiQ8963pA4MIXvK5bllrLZcCroFGYCxTRGH5RtJ6RRaiMbY4N7tDropyDf6zUb3b0p3dAtVvLxaqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Z4IVwcpZ; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Z4IVwcpZ"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-670fee39d73so3289630d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1790610407; x=1791215207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7d9v+dnfa33+IGduUY6om25xsOtSS5Ke8pK1c1zkhs=;
        b=Z4IVwcpZJEhH7ofdkvQT9piZ3ZJZ78Sjhs2n/FO+eRRE1xajp0sBE7PouiS4agLKLB
         8EhGOxdxJZGu4c9r91QLESCNRCYLGdP3Ugl6h6sdl3T88/dZiAXOUyVOBy5cOjGxYqa4
         jRUA0CYEkjzT3CqLzYGUg/vMGGfsIicUasfnewNjp7OgXTE34kvWjKnhtL2uqpxrnK2r
         lioINItW9L6k7fDLmue/bHXgBjAHfI5eKoax8pIncxICOWQKKM5C4PW369haiGvnmN6y
         1Z7ayqu1Ytpr+VHNiWXHStcvK5ZHUNQPGJ+z3UGKgHPTWegeRaTmSmJfZBuAcyg2pmU8
         6n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610407; x=1791215207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7d9v+dnfa33+IGduUY6om25xsOtSS5Ke8pK1c1zkhs=;
        b=dkGFLqjJLDFV9a/KltOOajoChVlSPACsN54HDYti3+MbYeABzhIN3wPJLG0Hrpj7C0
         qCl7pjocaX1MohKTuaV7TV5wP6z1HpZORcDGoAfsmXzcPwyo+11UJ129HOfiRO/QWww7
         I25rlumWdnoK6H3Yu9qhawwMdB0ZhBvGm5v3mRkaAeeaWeBT/OqAheOCw5EiPjszPVKW
         ySJAd48lROQGiB6rzF89JJdtVKJpgnOkjJT/HwyIBJhvGNStSsi5YDWxe5rsgsMednS/
         kIgB53LsC+WAtfAhLQW6wxu4uw2ImviqKPybQCWJ5bCwqZjmwmNwGX/1YZ4Z9AwIoCsN
         ST0w==
X-Forwarded-Encrypted: i=1; AKwUvBxgHh8PNMkExdc+xPGGmacigE4HgKB2SrbyneCGcMnGJqPvMSMOUPBx80SxRFQBsv6xU9082j4a+iRPDRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8GuBIaCr4a8bLqYLtxumb+po9nlHDw1BNdp/fB+XAVCNZ3VKn
	gwKf0YyTZROuYh0Mw8jA9amlMwaFhsPNo2hePskwbsGAfuDjwTWjUAPTab6XXra+PKU=
X-Gm-Gg: AYBFou0rg7ebCVOIUlgNXAwWVet8FxY1n6GyCkamOM8iVNgzVdsGnu+eqd7r6lHWka2
	5t+2QlNiGjg2NYvbztpwxl1N3ZNgF26muJrn6fFMbg2YShWDGlYYrTOxbZ8W3MrrcGSgJO15Zvr
	yGiduOIHHyTkRLqugQVx11uTY+0YZPjg99vO5o5QI+l2s7SMy5yQ8V5XHhl8GsgkhAEkEPAKlsS
	JvHuc9BnZWVeqee+4FAQDeqXByjhlhybOmvbfpquac/1pXrMY5S5jsraCTD6mqqlMWBCYgKp/e2
	acmUmk5UoGzopU+C7MWO0Bq6fdHZHiXlkN+1RNkI9aVcrpGZ5xbPwJJQVOhFioquXIR+ZjpI/ZA
	htkAhxT6mh3rKPsO70t+nGRJIQGXubUQuzzHCaHEr5d/XIBTftBOqXRkIdrxc5hHmOXEZwp4/OC
	oLfi9f6YGyNhKNpDktjAH6xe/SeR0r8bRHhowpNpBzrC/Vo7p81GKbylDNn6Cu10pzizatSvgCI
	pOTKh0iAvUc914cm1W6IYTmrA0Ty7SMCEP6
X-Received: by 2002:a05:690e:4093:b0:675:3247:9b40 with SMTP id 956f58d0204a3-6753247a525mr2940923d50.65.1790610407271;
        Mon, 28 Sep 2026 08:46:47 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e281a8sm82875936d6.33.2026.09.28.08.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:46:46 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v9 00/13] PCI: liveupdate: PCI core support for Live Update
Date: Mon, 28 Sep 2026 15:46:43 +0000
Message-ID: <179061032462.173069.6066907606098407222.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918200640.887030-1-dmatlack@google.com>
References: <20260918200640.887030-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 18 Sep 2026 20:06:26 +0000, David Matlack wrote:
> This series can be found on GitHub:
> 
>   https://github.com/dmatlack/linux/tree/liveupdate/pci/base/v9
> 
> This series introduces support in the PCI core for Live Update, enabling
> drivers to preserve PCI devices across a kexec-based kernel update
> without interrupting the device. This functionality is critical for
> minimizing downtime in environments where PCI devices (e.g., those
> assigned to VMs via VFIO) must continue operating or maintain state
> across a host kernel upgrade.
> 
> [...]

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=lu-pci-preservation

[01/13] PCI: liveupdate: Set up FLB handler for the PCI core
        commit: b9affdf3de08c9e5fd8dca0c0bc9c54041362a10
[02/13] PCI: liveupdate: Track outgoing preserved PCI devices
        commit: b7163342c1d4090bdd3eace61580197b2372bd34
[03/13] PCI: liveupdate: Track incoming preserved PCI devices
        commit: 16c1ff9563333530f97888fca4e48548b22ce282
[04/13] PCI: liveupdate: Document driver binding responsibilities
        commit: c7c6bc42b3eebba0562d128b5a578bfbe6a56d31
[05/13] PCI: liveupdate: Auto-preserve upstream bridges across Live Update
        commit: 6f58dec26ea52b6451b3b427caa3326b407883a1
[06/13] PCI: liveupdate: Preserve bus numbers during Live Update
        commit: ec2f2f51120b9461db0e04a7fb1fcdd9747fd96f
[07/13] PCI: Refactor matching logic for pci_dev_acs_ops
        commit: 05d208bda0fd3ef41c3452d1c3f5b365c75b59ae
[08/13] PCI: Save and restore the ACS Control register
        commit: 9f2072fd93310487bf3f51bd61f73ed722be3cc0
[09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved devices
        commit: 16709a37292e480a2d560242d88ba400e0793706
[10/13] PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
        commit: f20575f35fd9ae63f80bc672fc6b31e4de12d4f7
[11/13] PCI: liveupdate: Freeze preservation status during shutdown
        commit: f6590754926ecb0f9119f82a08ef073038ca3293
[12/13] PCI: liveupdate: Do not disable bus mastering on preserved devices during kexec
        commit: 25ff6ea537fa2c1258cb73d57f11d6af51ec7f8c
[13/13] Documentation: PCI: Add documentation for Live Update
        commit: 3b4d450a5bff74e36b4c9e864c0ba7d08288941d

Best regards,
-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
