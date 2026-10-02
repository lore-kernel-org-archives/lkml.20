Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E599A218E91
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939550; cv=none; b=oSNynouoO9OTEWEzkw8JE0jdwSQ60lKhCQLchnoMPkigl+eptIWhXj1RPkXHyxM1NTY+J2MSLvYtmEjMlmvKWVjkmfuXJ39faMklcJE3Iyu/8D+6RJCwTnG9riLLFF2bN6wr5WwRUgWC4KMLItwT+EChh05Sgrw25snRzS77s4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939550; c=relaxed/simple;
	bh=j4E8iZjMgWKr83Y3OdG+F88zPtRgQWu02JkVMPZweas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JimF4sPziSmPTG0hxqYMz8NPg64fiQFEznhgqVgdk/nkKopv7b+5bmk6NfyB1k7fd0OS8XnMty45UqqmJ9qyzBaTo/lYW8ZkWUgsyEUpBGOB93/pgxanBX9ZEeXBJVIqN49URmSOB/7+WbgtEDfHnJUkSvrVvDLXWdp1qx3NB1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cjIYnfEU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cjIYnfEU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so56640255e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939547; x=1791544347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4E8iZjMgWKr83Y3OdG+F88zPtRgQWu02JkVMPZweas=;
        b=cjIYnfEUctQg0tNuYzWcgp02Q81R9OgkQ6GS2kK88tj2eK9WNnfYEVKpjO3wDsDZxb
         7LMQ77/hcCB1F8DdN1M45iQAI+3eixSlIE9T4TxAJGAKO/XdaQFQ0UZNCTc+Wnyne7CH
         Msdqisvuf0kmVjyKnBuwwtMqzbIXSSbzYyWCwyPtwEjoGqGNn0iawJ8eFyCPI8z9hZMU
         1ZJ4ay3y8Rz39JjBcYALBHRNa0068ApH65PqLk40Cce/s7Y8ArNMLWJS71Br1BEkshfV
         mjgoOXoAuGgcNcysvBp7c7CDjgPu7VlQ4veyn67l9W0VP9jeApJo3J/WIMxDAWFmmMah
         AtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939547; x=1791544347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4E8iZjMgWKr83Y3OdG+F88zPtRgQWu02JkVMPZweas=;
        b=a127A/zdR7TLPI063mNDsm97ohv4sTWPlIXXeEowzZA0BmU7CgceUvCsywNGZFw9cd
         c8rpPsaWqUNZ+XY88cWpMtDT+40Z1KT8DtXiCpMQFnvcGPjdU0YlGN6n+cT38ziW17Ic
         fq1QGxvgMJX575F/nH98H+b+hu7L3EddGy9+hcZWQ4XzpX1qVqDVF6zmMluMgyGzyw3a
         c7+WlBSmLB+E0F8VhDyP5OWH6W/sDzdCrqWZ8ZQQaedJHdBCuMARkqtfN4oPuKvgo+ob
         V0TZSSVgXnPv7qfAtg5x20Cqr972rDLEPAXgjc3qsYrmcLIXzn2rmMFFheCgE0+DaXYS
         /NtA==
X-Forwarded-Encrypted: i=1; AKwUvByE1W+ZTtje3p09HWomjqab2oqj9GzjcrrYEThN3ltBlhxqr0a5RAFVXYwQh2wnUJlPgEj9fvJ+asQXqJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++n0VwUNK2Av5lIv0Y/XKAHI92kf8Btz3HJGY4IycIgUJuTgK8pX
	jcrnXbvfb3bTNuSnQ6/n/nfWXjGG7dadWJuqjXQep7vB2q9tOUCGk/tND/z5XOLZLh69rku0xfd
	u7meqWhmQIA==
X-Gm-Gg: AYBFou0UZneMMXMmdmAl9wi9eR060DpiOKr+xFotlwWHLnPJl0emO/oM6XdbVh4KDe4
	hT86JAI4on+gFY3PVyi2Opv+m4DPUTZoNQXn1fgb4qf+z1E4J/H+X/YP3Io3IWczPZ+i34galsh
	TbgCvoKE/d1lspcIHdEVTSX71HpblVRx+uA+ApbB04ixLA/zM9Uu7Rwv/r3qUKry7jeUBwTQCuz
	STQCKany05XVyRJ4OgmRIMapJGPy797Gh2fGq8tpmMs16NOFCfT19XyLxwNWLtl7WF+06v+pYL/
	nWfhh88uiQojItAzj4z7VBegjPoHPVW7BLY2dLotkOkHp1kEICaU5NqjzyMzW3lE966/Y7Z0dHD
	F0DPIlPXRzT0FuhT2eGU6aKugBJQDKcX37XPwFWZa6Kztm/fGBWpryEKDqm+DQEXm4ti/obc3hk
	lpgprz4X+BKOq8DhSl1VANEwQ7Zt9iAorMVRSlMyCk28G8Jdz9ePUOkesHLjMOhcgrGEJMhr7TM
	II=
X-Received: by 2002:a05:600c:8b77:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a027564df4mr41427285e9.19.1790939547101;
        Fri, 02 Oct 2026 04:12:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ae1sm5204513f8f.39.2026.10.02.04.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:12:26 -0700 (PDT)
Message-ID: <a300ab54-67ad-4081-969a-c1ddef69b8ea@linaro.org>
Date: Fri, 2 Oct 2026 12:12:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] perf: cs-etm: HW_ID improvements
To: Linux perf Profiling <linux-perf-users@vger.kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/10/2026 12:03, James Clark wrote:
> prerequisite-change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e:v2
> prerequisite-patch-id: 1aa32269a3a7dc76840dd8a24cb5a8715507e898
> prerequisite-patch-id: ef471f468351462f67efa58a09a3461306ac5a0a
> prerequisite-patch-id: c78946cf4ec1c7722570865403a3562625bdaa33
> prerequisite-patch-id: 0b953eee0252db3c7ba3ef1e3397048a94482ca2
> prerequisite-patch-id: 27da72c2f01bcc68205bbcc14d5019369c02cb83
> prerequisite-patch-id: 365c6d5f71c754e4c690b5ebed3453565bb5b809
> prerequisite-patch-id: 64e9419a41082a2db3daf255baf0fb40efbae5dd
> prerequisite-patch-id: 1dc2e6ef8e76b369736b4c88560302861b2e4faf
> prerequisite-patch-id: b7de38ec4d90f5b45d56390a4e5919a1d6439951
> prerequisite-patch-id: 3548d5b161cfb8c11a166ca2b3228ca4821f1ca0
> prerequisite-patch-id: 97e66600218a2b32e5b21d0abcb6321590f98de9
> prerequisite-patch-id: 292282b20bd8ad7d096ee7ffbc55dcfb75455f53
> prerequisite-patch-id: c80259b47850ba65c985c85a29c8cf4948463d59

Forgot to remove this from the b4 metadata, but it's no longer true.

