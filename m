Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D55D3644DE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570778; cv=none; b=YFdfUWBFQwGixq2sA/MpS0tTduyCIqonPkS7HttNhS11RLZl+3eG/cXhGUjUI6KrNXuHEb7DbQ5kqWIADHl5xBU1IiXA772hpkdqGvrS/3a1tZ+powu55j/F9V3xba2Vgicux+sw6h8c8ad+9LRjM7CChuDybXqlDCQ47xiBDB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570778; c=relaxed/simple;
	bh=4Jl2TkRe7Npn73HaXfPcA4VVvCfEz91QC5XBElprxe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lmnf/81gfuzRuOrZIAWnrKAMcQUq4iM/u9ROaGt2vmC4gs+Pht6enzaZNofHqHFO9FPknV80W2/5mwYGgwKNWGC2LtxC0hewO2KUUtZqaOK40P+BlcACZogVgPBcLzMBRh0vuuPi40mHsoX/PIhXasbmuqJDq4ZIcPb0vreMvrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgTrxaY6; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgTrxaY6"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a1676000so777373a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570776; x=1790175576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3xRnvj52pHagz8sqiex+4Km8FuQRJvZZV/xhDBA7TFQ=;
        b=mgTrxaY6AZiWnAmxzZcwig+v8VuOj+GoOmPuCoYjuUhhq5IIL+2Z66c0z8BGUyNlpS
         GC0E03q1m8DB/5qMetvoQ7lBrq82C9MkIPbwq6tLTioTeM0gs2wCRe8D1abga00n8eBQ
         znI5azqw95s170A3Lu6JWplgLcGwNxrw7TYFGUhAyOPjUqAZyO78aFCeUuJAJOEv55Bt
         K7daPg6vZj6QLju39pd63nVDsSdqvfvrfYnF7nleEQAjVGcebVQYb9YSfeBZ7k68hurj
         /8rIDxaLgHq4o5iMCc9wq8Fs0If1RRvtUwp/ZViZYfo7zAcb7dRpvVjL+u6g5hZjqu78
         RfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570776; x=1790175576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xRnvj52pHagz8sqiex+4Km8FuQRJvZZV/xhDBA7TFQ=;
        b=dzK/TgB82b7AWzIc4Ji7oiIeuFi11FRQay6ON0nHKUV9orSZ5I6jiVeehLZfUHDiBE
         UEBR5n+1K3OYs2o0mlEyIUVwujemHa+DlMRIC2ebdM2Rm9J3NcU8QHF2qTkCODgy5jjQ
         7ery6mF7yNQRTgqOopktOfRs1ENppXjzCX3bLaef5/HOFqB2bDL7iw2sNOFGFahFS3qE
         4RRTy/C1AwW8U+7C7+8pG4w2a3KJz8bTrZxamx9ntmzXd7cLf446pm2g9RObmu0sBB1r
         VQLMW4Q5HsqvSHwgECIKJ1pZpaWwkbpAxhxrJOCnGl6jx5EcUScLCPbv9nrdHG0VA/UI
         Cv5w==
X-Forwarded-Encrypted: i=1; AKwUvBxdu/nO9bskrvx85b/HPQZcCgg0bqgloRrT07ccsFq2HoBBersPiZ9kmPClBXlUMSGsIELmYGyDkdCU6gw=@vger.kernel.org
X-Gm-Message-State: AFuF++n2dg7gnA3s+tMnl9ymjmimrhI3SFhlIwOVLE08fxzmJ5glmdti
	T8hc4aWes3qroREo7O3A6ibr/QBeq+f/D8LWzJFuNxRN2XVLsf07TQwt
X-Gm-Gg: AYBFou1aa0uWuXJLHZCqqdGgOPB7ikvAicgJab4KboKZy8xvEI9cIShy1lE27G6v/Qu
	/FrsnFPDgrZhQOm6F1OVuaol2I8O+t+P694o4qIghPdCsBMN+ciOspIbLxiD+ssrOxk9csNImnK
	9VbbOCebZdnN0bITLW2MjZPKXwgJWTykew7OKHxB1Hn6N4b7XAgIbeX77ryGF6LRBcfD3YivZhi
	Nj5jGb8Skg5zWqKM7Wwx/iaXo2gobabZVXNQolm0liTI2MWUL4MeGDnB/c70E7lbegoRmdVv6Qz
	so9tsYQqm4BT9qTSHBXp6wMZzjMOtoymvP8+na7g4qgcwcZlTlfE09uIVd+k6fmCad7/r4Ru6AK
	tkGT0fjWujqOtiMRVSAsYaOkhhEO/0CD1YPD+2/eIOFIxYdgB729rXf2co6ZixJYPIHBkyK2Ega
	DOcqjTxJzqSbSwh2DGQYHwg81gAuTMKGpxOsG5CCxf2lIs1xP8dVN/vizhmhigGWxctsbuSxsxe
	cu9oYSvBfcz
X-Received: by 2002:a17:90b:582b:b0:39d:c3bb:98e7 with SMTP id 98e67ed59e1d1-39e1e2eb37cmr7040268a91.6.1789570775729;
        Wed, 16 Sep 2026 07:59:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbdfd89sm5159630a91.9.2026.09.16.07.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:59:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:59:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Senthil Muniyappan <smuniyappan@juniper.net>,
	Vaibhav Agarwal <avaibhav@juniper.net>
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/tps53679) Add support for TPS536C7
Message-ID: <7c73bd97-a3c5-4485-8f16-57b128aab7c2@roeck-us.net>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-4-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915164823.160977-4-sanman.pradhan@hpe.com>

On Tue, Sep 15, 2026 at 04:48:46PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS536C7 is a dual-channel D-CAP+ step-down controller whose channels are
> distributed across a configurable number of phases (N+M, up to 12 total).
> Whether channel B (PMBus page 1) exists depends on the phase configuration
> register, so the page count is derived at probe time.
> 
> Factor the TPS53676 phase-map parsing into a shared helper and reuse it
> for TPS536C7. Only aggregate per-channel telemetry is exposed: leave
> info->phases[] unset so the PMBus core never programs the PHASE selector
> on every read (and because TPS536C7 can place up to 12 phases on channel
> A, exceeding PMBUS_PHASES). Report VOUT in linear format like TPS53676.
> 
> Since the core never programs PHASE, set it to 0xff on each populated
> page so READ_IOUT reports the aggregate channel current, and verify it
> (PHASE can be write-protected). Fail identification if aggregate
> selection cannot be established, since otherwise a single phase current
> could be reported as the channel total.
> 
> A configuration with no channel-A phase is rejected with -EOPNOTSUPP:
> the PMBus core models pages as the contiguous range 0..pages-1 and
> cannot represent a channel-A-absent topology.
> 
> On the tested TPS536C7 (device ID 54 49 53 6c 70 00, CAPABILITY 0xd0),
> block reads of IC_DEVICE_ID and USER_DATA_03 return -EBADMSG with PEC
> enabled, while retrying those two reads without PEC returns the expected
> 6- and 24-byte payloads. Standard byte/word telemetry keeps using PEC,
> so only those two identification reads fall back to no-PEC.
> 
> Co-developed-by: Senthil Muniyappan <smuniyappan@juniper.net>
> Co-developed-by: Vaibhav Agarwal <avaibhav@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
