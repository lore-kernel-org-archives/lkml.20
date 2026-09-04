Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EC13E9C17
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528255; cv=none; b=fiD+aOxNlvIEicUVfaNkO+j8L8wrZ2IdRGzQOvfTiKDleehsBG+QCIN1R7nypqL/1hCCpQAm9bFu2BvuVXVRyTR8XMP255syjqk+Uhd150iXhZGi7dR7YfiPlzJNXSjfZIVfortID/hAddigeeCrRzBX8d/mGrhDoO77Gbyk12g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528255; c=relaxed/simple;
	bh=rY/FD17a7G/eWAVvA7Y9WrbqEygpxDfhs21tRyAeJRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IL2iWGrORvWdGYBWcdo8a4WLQu5vEajKCJQF521nT9L+GrQBh9JEmeiLPQ2waUrKc9SJVVmOIliTvuxW7JH7U1qzZU+NpMlLAyJl5P0TxQzGPbjRwfH8jL/duJsmJ+5VlzQb1gRm74e0T4Vl49Jpbpwfn6xsg/nIbByLQz6LsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RwNy9KuY; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RwNy9KuY"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so683268a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528254; x=1789133054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gKnbVJWEFk/CLsBUPWolgt07xLoRfVm3ryFkAF5KIOk=;
        b=qwsHa0k0mdhvTnIJJLwNR24ntev8Py9HaFzKJWoOsSnsL5ANRsEcKsRuIpqILDxSNR
         lGK6jcoLcflGRB1Mw/c4FShKz04vF5LKAibr2o6Qx9h0wn+ae6S+tMAS81kkRUj7yrp+
         4mAhVew6/z3eVX88inS39yVb4G/akP58/rmugirtELanWByVWIrSxdVvnuGp7OFDpwto
         zaz7yOnE+lGdSpgCBMfo40ny1hafAS0dDBdXt1MxZgAX/xMpyJlgQPnGv1/E1895qlY2
         8T0ryJfvHg0J6tMyAhHw/z2wLHXUIFqyKzJ3Ltz4wfe8GDo1k+pp9HB19s1qqTzb7Ug+
         ewxg==
X-Gm-Message-State: AFuF++lTOC9t8h+8ard8ttnFPm4ez466ZNz5KY0mQbxh54p9LSVbRc5a
	Nn6QhiAanu47jhZd0kYIShmAQADIPJf4x0ZkWfF41RcUQ9+OWPE9Hux0SBsEy25LtORfgCBmcY2
	mk877YxfvrGE85CMx5XGI+fE+XuaGVEuDuDC5Qye4uFNWL9rmAKXynu6FULMisUTXBBqZOYO8Ml
	n1Vr/yBiNzn0gVa/JemyjDAmpWLESZ/ELXyhblN73DqYB610pY0qYbLCVz0kDhL1X5DWyu8AZNJ
	R5aji1Q2sMy+OPyMj//JMKY2Q==
X-Gm-Gg: AYBFou0jDYz97ymiB1Ol82mG2Dx/dPoeHYFX7qJ6pPA42ppqg0cm6mP/+w4Bcu0ZFMd
	a0G6GzCK97fBtqlx2OqDY7x+uAM+ULWB/Z+OOQ+x4KKrvLSbCzAZPWqNvDrEQAFJU/50FGkEbZf
	1GfR8nxNeTYCiune3e7YbnyGL4Cf2ROZioYSTW38hGPNUYJfj6AgzN0nUPxMng+23Q/XdBjivyP
	JD57XgVOmYaK0QSP8FyGx3kd3hje0OiOPZY0yfZ0VpcgBq142ZZJFDXzUyZEV0/LHK+VXCvQuwM
	NBLtkP+FQRuFkITWlQypQ+xJwV1Xh9IwCZje8tRT+QhQPsujP8OXsBJi5kGEvELeRD4awzhS9ty
	6yFmiZ0WXewj46yt9J9Ag26npVrUs54f4f/Qgw2JzMil2OaQCtxUfgWiIHB/74WMm8VBH1qbjRs
	X5f+g9UAGgyfysZh9S0xO2QGGEP1BHFMuqtXOOJ/U=
X-Received: by 2002:a17:90b:4d87:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39b26100bfdmr8142885a91.6.1788528253632;
        Fri, 04 Sep 2026 06:24:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b260deb53sm1429931a91.4.2026.09.04.06.24.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:24:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so248068285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788528252; x=1789133052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKnbVJWEFk/CLsBUPWolgt07xLoRfVm3ryFkAF5KIOk=;
        b=RwNy9KuYMMb+fi6QdRt0NtpDzPp5liF9hVHX5hR6mxQXYficPSc3R/ONSI4Wc4LJIV
         PuA8maAGz63nY4BLuWUT7/MelOEbhLTrEnnTEtIxfpN8KkotoyjRLHjZsLh6pINMBMGc
         jFfTmT9iUJMG5PxZLOzJYHqM53V4wPwzOg7Yo=
X-Received: by 2002:a05:620a:d95:b0:936:bc40:cae2 with SMTP id af79cd13be357-9398072a8c0mr585324885a.39.1788528252112;
        Fri, 04 Sep 2026 06:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:936:bc40:cae2 with SMTP id af79cd13be357-9398072a8c0mr585318485a.39.1788528251581;
        Fri, 04 Sep 2026 06:24:11 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb33619sm210778485a.22.2026.09.04.06.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:24:11 -0700 (PDT)
Message-ID: <6e946b7c-50f1-47e4-9073-1dcee4f141a7@broadcom.com>
Date: Fri, 4 Sep 2026 15:24:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Jeff Johnson <jjohnson@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Christian Lamparter <chunkeey@googlemail.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Michael Buesch <m@bues.ch>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 b43-dev@lists.infradead.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, libertas-dev@lists.infradead.org
References: <20260904124353.6183-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260904124353.6183-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 04/09/2026 14:43, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.

For the spelling corrections in brcmfmac...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   drivers/net/wireless/ath/ar5523/ar5523_hw.h               | 2 +-
>   drivers/net/wireless/ath/ath.h                            | 2 +-
>   drivers/net/wireless/ath/ath5k/dma.c                      | 2 +-
>   drivers/net/wireless/ath/ath5k/pcu.c                      | 2 +-
>   drivers/net/wireless/ath/carl9170/fwcmd.h                 | 2 +-
>   drivers/net/wireless/ath/carl9170/main.c                  | 8 ++++----
>   drivers/net/wireless/broadcom/b43/b43.h                   | 8 ++++----
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcdc.c   | 2 +-
>   .../net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h   | 2 +-
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c   | 2 +-
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c    | 4 ++--
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c   | 4 ++--
