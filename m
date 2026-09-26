Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF08854707C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459286; cv=none; b=vCvQ6NW9g+4p55D/VOxZW9MF1ELjfDeTyFQDlgE11bV31zD3+RFkqDUaf7CvDHPTixCfOuIZT6jBlbM3tbmJUbavp9oMtLGz+3GgwMIkOXkKRhn4Zfd5t+eYbEZIJazlcpKhNYQ7eY7uXrDCN+1TFDFwLwohvWhRCXMio0Gbf9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459286; c=relaxed/simple;
	bh=ZZbeCC69lXHfHZSTLFpxIC2y2sA72eUoYyGVtuXjY7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WdBbYHhlKTDzWYm4Xp3yqtgjXzsjkuUEfCv7uyvKtUqAnkWiA/bd0zb4pF0qUVv0B9/KcmfX5E8Q7AsSDy1bNS8nkgTdfDK+ZuPKkh1d2UDU6j40ogK9WX+EpL9laO2G0lnQGQOFDy4S55jtCIeODW3lJBqaiE+A1SycVIt++vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JXt6Eent; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JXt6Eent"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d3b445a84fso34075ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790459284; x=1791064084; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qgEs2vcdrIkc6zyBU9wFP2ey+NlO6hQzMcCWB2MTqU=;
        b=JXt6Eent5EHjFX6sFTUSikySZ+yaBv8UjmaI4aWJMvghlJuc51kdHzvJAjEl9mhPqM
         /w0JMhHB6r4SwyNEtijDkd4UcMbTtzZ5t+Pt9esXN9vxiWOJPytIB02Jnfam1h4/5Vl2
         9tZxZLNBJdLc9hjj+uttPVg2AuCYGlDtiqpX7AIX9qC3dV4FQfMA2pujymRfVgY3MhsF
         g6HjpldPuJQI8D2H13QFgFjf7k44nFnx1ZBwynQAtpf/okL1XVpvRZj6mH3NwzbcXMcp
         gAUuZ/csHF1ZM9glDbtVgPY5E08Aou1pV65zhKCzccaA65aCiOzQVakJY3r5GvXXzzVj
         0mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790459284; x=1791064084;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qgEs2vcdrIkc6zyBU9wFP2ey+NlO6hQzMcCWB2MTqU=;
        b=x3xqcQ8Fn1o0Llfv2chFq53/8dz00AIPw+U4I/k+XcTDeuwP1XggGiXRHNaGhTU2gB
         rBDn6Xz/u35dJVyqKn26AwQ7eG4t90yuPye+ZQjShA3PNg3iwdXSvLweZ6P14kV7n4YO
         Ie/zrAN91Y7kSNMiRQL3G7NScuOt8x6LsswtMMJahY0N/ni8ByIgTP/4GW0iOonQQP3P
         zc9oRXEsY9HcpAnJo4zomruDaMOk4hBjF3DBjE0gvo7a3EoB11YTc88P/Nqn5iuGCGa2
         naRLxDF52LL+4q6aGRUmsAyPGfYRnLIDfNmmGE+zV+elauqt9Z35xwk1YgJ6lufCkK8c
         Kt4w==
X-Forwarded-Encrypted: i=1; AKwUvBz2bddSCT4qHgRmcNgFc8uLSLOXjC1bIrmaCIR1TpfDWdbz90hhEUhNF/QKgDZpdNlyhCSJglex9V+WqXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRA0zuk7/xfS0KQ8wskecIRqx4iXiQtdU2sNreDFz6Pvi62Snv
	Krbco85izysZZ4VMDjKF3a4PSEzaszOhv3evAu+eu03vEVoNJPP7wpxpf4PJKUJgsA==
X-Gm-Gg: AYBFou3R9NjQvRqPisPj46FxFr546xLKhuM6xiGA9yvK0sMUTuU0Q/zGMr2972JbW24
	qQ6RRMRD0FujDn2jbtvEwaOZqw+aUbGuSQ+GscvTKf21iRXqhBsHFlhBH96KfKXvpj5zMuDDAil
	j6tM5W4AJwOyiyD0uIHrLkcGlErcFr7Qog7kzjIIl3EVCzDgXLFCI+qL0YtDtbPTyADiHxGTypv
	ihQvHK3M6XHIVyZU+q+mkf14KIz6EBJFD3352ZY/UOIqUW5B5Ag37NKVCPFijwl49JtpGxY020C
	9F4yvPrnTet3NKYnWa13eapm4BgcrtUp+DWdutuuu5NYbj+GPCtAOJ/g6Fr9wCxk4morNIITRmd
	tWEDZt8EP4hv5Rhp3NnKSubIC6bPkYONpo1XeRl0mpl9hm+wmdlRTebNwojmdsPv8I4RwBwk0WT
	ukgNTo9d6ONYem/FYg2fSDD6kWxLe5NWDDWWDjz5Uw8q4qg5pMSFecfjpFEZh7Ytk6kTkC5zscG
	kUXKNfSm4/wyXdpsbhcRnT+VEjYH6EE6mVDEcIp6BgDnjG3u0jHvtntREcDV/e5EDWlS+uOhsCN
	yH0OlJ4XsnggoTi2MxRfRC9CDKXLicgD4IlA3nIXmBEygVFNNGtwBdonulvLvgZYY+sUpaEDVg9
	rNnCu36w=
X-Received: by 2002:a17:902:f684:b0:2c7:f0cc:dafa with SMTP id d9443c01a7336-2dfa973eef0mr2554795ad.5.1790459283114;
        Sat, 26 Sep 2026 14:48:03 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:125b:13f7:c69d:3887] ([2a00:79e0:2eb4:9:125b:13f7:c69d:3887])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c719f86fsm9058892a91.7.2026.09.26.14.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:48:02 -0700 (PDT)
Date: Sat, 26 Sep 2026 14:48:02 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
cc: Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [patch v4] mm: vmstat_kunit: add synthetic benchmark for vm
 stats
In-Reply-To: <cfc1edae-8aaa-8fd0-95de-af3d4774c6dd@google.com>
Message-ID: <88982723-cf05-52e2-92fb-f14c0dc4dc77@google.com>
References: <cfc1edae-8aaa-8fd0-95de-af3d4774c6dd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Sep 2026, David Rientjes wrote:

> From: Christoph Lameter <cl@gentwo.org>
> 
> Add a synthetic benchmark that can be used to measure performance of VM
> statistics.  This is used to analyze any improvements or regressions in
> functions that are frequently used in hot code paths.
> 
> The test is run by KUnit or doing modprobe vmstat_kunit directly.
> 
> Sample output:
>  KTAP version 1
>  1..1
>  KTAP version 1
>  # Subtest: vmstat
>  # module: vmstat_kunit
>       1..3
>       # vmstat_test_inc_dec_zone_page_state: 10000 ops: inc_zone_page_state -> 8 cycles (4 ns/op), dec_zone_page_state -> 9 cycles (4 ns/op)
>       ok 1 vmstat_test_inc_dec_zone_page_state
>       # vmstat_test_interleaved_zone_page_state: 10000 ops: inc/dec pair -> 17 cycles (8 ns/op)
>       ok 2 vmstat_test_interleaved_zone_page_state
>       # vmstat_test_count_vm_event: 10000 ops: count_vm_event -> 4 cycles (2 ns/op)
>       ok 3 vmstat_test_count_vm_event
>  # vmstat: pass:3 fail:0 skip:0 total:3
>  # Totals: pass:3 fail:0 skip:0 total:3
>  ok 1 vmstat
> 
> Assisted-by: Gemini:gemini-3.8-flash
> Signed-off-by: Christoph Lameter <cl@gentwo.org>
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
> v4:
>  - included sample output in the commit description
>  - switched to NR_MLOCK which is display only so no side effects
>  - remove unnecessary "rem" variable
> 
> Once we're happy with this change, I'll apply the same treatment to the
> proposed pgalloc and slab tests.
> 

Andrew, let me know if there is any additional feedback for this one and 
I'd be happy to integrate it.  I've got the other two test cases converted 
over to kunit tests as well per the feedback so will send this out as soon 
as we're happy with this one.  Thanks!
