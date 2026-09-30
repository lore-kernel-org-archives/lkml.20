Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1654BD7AA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766010; cv=none; b=DicN5+LIPrs19vPNb3r22E6dNA6WVGY7mfSr6Bg2sB0ZycPojNWyR6fmrFRyNKTea9i7WClbx6iXOVaw0GwbFPW4FjlFOiBfjk9wzzIYrfN5pW2OGGaKT2+dv5h0ydq23Za7bOpDi/W4qCRM8PWwfE47DnexckG+19AAZzpUoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766010; c=relaxed/simple;
	bh=VXbwWAA2rGOCrZka7cjtcYwvbR5kzNs9BT06htzz/Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=atNLaktsdqeiofAnajuzVZWLOXF2pzbhUmDHN7AAv9qIC5h1epcicbIW3yms94kNL8glgcIpcciOkPuZnAKbPD9Vbf0S/z/XB+9V+r3ww4UUo5sdsJEX48RsqiCgjY9aQ3+MH8Qgd3scJyJ+HkDJGdeWR/WqGVSZ60X+L/Dhzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qshiNve+; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qshiNve+"
Received: by mail-oo2-f36.google.com with SMTP id 46e09a7af769-82067e86a89so171075a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765996; x=1791370796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Woc7loh+3fAfJUM+qt0sDz2j23/UUVhg4Uqbsoe5iBY=;
        b=qshiNve+rTMoIseNxIziioZkq1WxWbPKi/1HS4qW2igRSeoleQkUIbqNDjYC8K+NPp
         HxfaB6H6rWIIeV5jk+ST+f7F0sWu+29CSXt15amSWPFOmqIfZlfbeKmc11S9Y8bhDmC8
         fI3F9v9ItU0Nx4FpMjqKFRw2HVQHGHTrXTNSMAq7K0ytLJOzLsmtszYmOJjgIpsF2yiv
         2rXASWxbAOar/qW/n67QTAdFgWh4TshcJDw9r1nrvGGf2itoPHBBOI/Y9pri8KU90nZG
         j/W8Rm5tC58TLN9x4H8YJ464Bl8bb0qmc1Q1P7KIHIa0ZTi32yFvyii7FIs3pdoTk8Pp
         SU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765996; x=1791370796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Woc7loh+3fAfJUM+qt0sDz2j23/UUVhg4Uqbsoe5iBY=;
        b=NpnMn1kmklJaMUMY/O6LxqQL3MRR6vHqj9R7pIDFLsbw3UoTJzFyEyHV0HlwFwsZAN
         4gWXIcsR6NlBiSqCjBleV5TSDDUwvwNtT8KbdX/JuTZ9huzTcmtCc5AIWfWqf8SHvPdj
         2kxT8QPNyEE3j5CeL/WQereuKb512l/Mog7/QP4Zls8uEuLyxDGrgeUu4S58Z+Z1YCbf
         km15k9Ta0q4SedLuEXr/7xwDZZSQUlaCv2vQQOg2wWJlUVztCEK0ijYyH2mjtjkx/xjr
         5hd+7w9NwmFklnxKGyKtsuw4L0eDH+UjmEPiXUiAQK2e7Bomtw56OdwZha9qdztKOoBG
         1tIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxf6MXWCOg7PW9X6lxYnFynGSPF/miqyeXpnDb/bf4ATukZs7PzOlBkuuXqji9uDoPMYwLgyqJCLkYZz1k=@vger.kernel.org
X-Gm-Message-State: AFuF++lf5OIOlNG3Tv/22wWNoaofHqREHftdzGAlUZoPV518Y0RSKs8B
	HHW/Q57f52AzRVRqFxHKHTZW3SN3APh0GYC7WBe1P7qs8k+meNugkEL/
X-Gm-Gg: AYBFou1Dx5iexrGzld+FhDYKOF8eEUd7sy7ntQLknPt8Ey7W2quq4TGF3TsONoqLRoJ
	IwCcbowRPKa85s6qzL3HgSh2usSpGTM1QLfv8WvmI2UtSvn3KVse3rUnotAvhxWusvL1GnT+fFb
	CB6jksOrXIGJHXdaWFmGnxKScu9VpVnQhlh92zMwnlAR1PH8f9xknJGzmkC3UCutV1nYX5ypl9A
	0eXahrx+Rkm4RRnBKbDCtn+BDZ0hFF10DJIvHJG5XdJwaECTmWK91kpJKZHXZH7sKiYAJMwPRrT
	OXIBVN6UpI8G0FXhHFw9Z4/VmzX/zOzYq7sVq4hKKcMdDltkzMKMfiztnx+duwj8YXoNxl6NgX5
	vCLaTKdmgsr0Oy5zhLewamUZfWGVNzaWnywA5xhTAzD3KWjmMDA30+p1PXFZfvPAbmtx65Xa3+x
	LmnSFc2xQMviGuA1qeVOiu71/6iVMS6KqcJfRaN7NJ6hWN8/qYfBACBWdKK+EhiQrZyvRvrZF9O
	qWjVCHFbrnC5BvEU/Ok69Rg8ekomA==
X-Received: by 2002:a4a:ee14:0:b0:6d8:e140:66d1 with SMTP id 006d021491bc7-6dcf4b6698amr692225eaf.23.1790765996325;
        Wed, 30 Sep 2026 03:59:56 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:48::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6dcce85d9bcsm1045955eaf.6.2026.09.30.03.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:59:55 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Gregory Price <gourry@gourry.net>
Cc: Li Zhe <lizhe.67@bytedance.com>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference with MPOL_WEIGHTED_INTERLEAVE policy
Date: Wed, 30 Sep 2026 03:59:52 -0700
Message-ID: <20260930105953.3956219-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arzR_QtoMPtM5kUB@gourry-fedora-PF4VCD3F>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 05:11:28 -0400 Gregory Price <gourry@gourry.net> wrote:

> On Wed, Sep 30, 2026 at 04:59:50PM +0800, Li Zhe wrote:
> > On 9/30/26 4:43 PM, Gregory Price wrote:
> > > On Wed, Sep 30, 2026 at 03:26:17PM +0800, Li Zhe wrote:
> > >> Allow MPOL_F_NUMA_BALANCING for MPOL_WEIGHTED_INTERLEAVE.  As with
> > >> MPOL_BIND and MPOL_PREFERRED_MANY, keep migration constrained by the
> > >> policy nodemask: if the CPU's node is outside the nodemask, do not
> > >> migrate the folio there.
> > >>
> > > Why for WEIGHTED_INTERLEAVE and not INTERLEAVE as well?
> > 
> > 
> > Thanks for pointing this out.
> > 
> > I focused on MPOL_WEIGHTED_INTERLEAVE in v1 because the motivating use
> > case is to seed memory across tiers with a configurable ratio at
> > allocation time, and then let NUMA balancing/memory tiering adjust the
> > placement based on access patterns. With equal weights,
> > MPOL_WEIGHTED_INTERLEAVE can also cover the regular interleave
> > allocation pattern.
> > 
> > That said, I agree that MPOL_INTERLEAVE can be handled consistently as
> > well. Since this is still an explicit opt-in via MPOL_F_NUMA_BALANCING,
> > unless others see a reason to keep MPOL_INTERLEAVE out, I will extend
> > this in v2 to cover both MPOL_INTERLEAVE and MPOL_WEIGHTED_INTERLEAVE
> > with the same nodemask constraint.
> > 
> 
> Looking at it, is there an actual reason to limit F_MORON at all? Or
> should we just lift
> 
>                 if (pol->flags & MPOL_F_MORON) {
>                         /*
>                          * Optimize placement among multiple nodes
>                          * via NUMA balancing
>                          */
>                         if (node_isset(thisnid, pol->nodes))
>                                 break;
>                         goto out;
>                 }
> 
> Out ahead of everything?

+1, I like this idea, especialy since the switch-case break case already
leads to an MPOL_F_MORON check at the bottom. It would be nice to just
consolidate this into one generic path at the top and simplify the
exit path as well.
