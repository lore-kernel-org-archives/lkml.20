Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354A8282F0A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690927; cv=none; b=T/4FC3zM8Rh3u3jrjneGZ3tD22/ojmcyVRJzXBVlizeuOyhf++0smVcjk5Sr9lFQ8Es6Exl3GeE+lbOxTapNxnXGEBLs5n/MG56KPt/XW7M8ckFfggG8hdRbf1RY+mEeLFBRtCJTwCRAxXyTo5Gc8uORyfIB6RRjrg5KbyOAmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690927; c=relaxed/simple;
	bh=81Al4bwaDbkS8RuD0G77U4m0bNlki511wftCyh1UIzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epzXiZwg/Yj7ynS6hhD+M+PI/dQUTpKy7WbMbZUXUJLINEfV01hiWWbMOyv4oXwDwIzi/E9NfkCkD6SLVEVvgLhgZ0Khix8kflge1V7OwoNnNXoQs4AUzGvNFKHOFyb4RfydtGV1tpDv3LhwweIdVzclEbIMJy1IPpP4kBPcExI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwnpSwhn; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwnpSwhn"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae1f2cedfso5513919a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790690924; x=1791295724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xe4sMjFI7Bnhs5VJABLcVxZS9wdqwlCcJPQVGcmwjL0=;
        b=VwnpSwhn9wmzpgHMo1zEPMoAHce6s4dkRuNlqP4kt4aPbStX6wwgEtT62TojSzd8rR
         r7RN6xIYr3uvD6dtr+DeMcNRtlQDnECFUVTBsrExGhfAqFUA46/CQEFaLEL3VlZP+nVU
         gNZisIg+L2hXdjiCQP/LhC5NSU35pfgLgEFhZ6yeho/ghPyDZARVrdiSydRNnUQQHUYb
         BcZIPOpFCjpdX+3YRWuqgz4IT0ODHY9YyM+agEfqnQUsX8RbApowfX79MfRUXWUIx5gc
         RMbwgFesOT5l5U9YUyvAqHdr/rLxX6HlR9jVB/ZW7nlM5jJyrwKJe/q7M5aQa53SNt0E
         JTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690924; x=1791295724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xe4sMjFI7Bnhs5VJABLcVxZS9wdqwlCcJPQVGcmwjL0=;
        b=jW54rA5XgaCs7BKtQMrrIRwvy90TljeLs8NxoV71nSXBh8XKmrc/GCOSQXU7OgU5zt
         typuukSVdo04LPnaO/Rt4NEfVnljbQqpxe8z+rTcEp90LOfwl/MVJBumWdDGRGL/DrfH
         BAzCr6CMyCoDWTP0iNupHLQicGIMaffpnhBY0M4cxshtPMtZeQF/fOBRNeVi8MlspLF/
         NIgqt2wH3wvRsBwkpQrQ4ehhoJa3Os8aSEwbXNxBrHbBXvpfrbfElORz7P2faNPjFdsP
         me/TAn8Y7ZRMi7KpE7paAaN1lCD0JUSjv6yi9CdHskMexPxVSbCgqctkutRujPq7uUTy
         WqFg==
X-Forwarded-Encrypted: i=1; AKwUvBwQsI78CR7N8WCgN2HXARQ44ghAV1D+NzqafeBchzHj/eCk/ROns+4XSNk4yzDkii7F3O6RJs3LiVmVKfg=@vger.kernel.org
X-Gm-Message-State: AFuF++nodyVSnGSh7BZE3/3ffdX07wQntA4v3MoO9wtD8BWtjJLZa8Z3
	9+LL9X5igS1Q7U5swtnWXJX+4Ailpr8BdI6nYas2dwtc2i3/TEM388Xo5HJO07miHV//5LXh5f7
	r3jh25TA=
X-Gm-Gg: AYBFou2/LjVfac9EGEyxzO5cLLF2G+qC8mM9BJcsXOda4vO8Y/V4d6JUSGOIw6ns4SV
	EtHjSEH8PKLnShm7WxvffH8rQ7h6kOaVF6UfEVVfPInWrK8FcpCj2pAQad2PXllowo8NQSOxeG7
	W8cGM0r8tOjpENAG1jFAcc8VGJmme3iAUBpvGsdv6itXPxlBnut5hoGLHHefUHMwJOCEiPBst5S
	zJUgSxFBG742Gx/VOjvWPi/moUaZbKiaQg0jBm1nFFVo0Y0Z3KP5QmWsiQP2KeB/Xw9VbjK8VXJ
	6HV+NubDjbphTpDxxPVww+4ERyyFyVrmfdV9F6rtpareYiuVx40BMYKuYcRD7YLxOHgw1iqFA5t
	9LWfFBZfcYPacnh865UcHRRvrJYfMh8YZBFFBl99WGb8MrmFj9RIKNljdCu57ZOESZqBWF6CPh3
	+S+AiqpaMOpZABWiPlAS4qiCgqEqxJsC2OAeUDWtlPu0w++HQTqBgXn4GzRwiHBUXPgson6nxff
	W0=
X-Received: by 2002:a17:907:c71b:b0:c29:53eb:9913 with SMTP id a640c23a62f3a-c2ac2531dafmr1335251266b.38.1790690924276;
        Tue, 29 Sep 2026 07:08:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dd68a6f18sm337834066b.52.2026.09.29.07.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:08:43 -0700 (PDT)
Message-ID: <7bed4275-0b97-46d7-b250-5039aa95eccf@linaro.org>
Date: Tue, 29 Sep 2026 15:08:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] perf cs-etm: Classify exception calls using the
 exception packet
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
 <20260923-perf_cs_etm_fix_non_taken-v2-9-6ab8c07a5455@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-9-6ab8c07a5455@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/09/2026 16:21, Leo Yan wrote:
> ETMv4 and ETE use the same exception number for SVC, HVC and SMC.
> Identify SVC by inspecting the instruction before the preferred return
> address in the exception packet.
> 
> Preserve the exception level and preferred return address from OpenCSD,
> and use them with the packet's ISA in cs_etm__is_syscall() and
> cs_etm__is_sync_exception(). This makes exception call classification
> independent of the preceding instruction range.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  7 ++++++-
>   tools/perf/util/cs-etm.c                        | 10 +++-------
>   tools/perf/util/cs-etm.h                        |  1 +
>   3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> index 469aba5e596a791289c5bcece132aba7b0baf6c3..48e8c355a3e495cc30dcb4056c04a034d10ce860 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -511,7 +511,8 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
>   				 struct cs_etm_packet_queue *queue,
>   				 const ocsd_generic_trace_elem *elem,
>   				 const uint8_t trace_chan_id)
> -{	int ret = 0;
> +{
> +	int ret = 0;
>   	struct cs_etm_packet *packet;
>   
>   	ret = cs_etm_decoder__buffer_packet(etmq, queue, elem, trace_chan_id,
> @@ -521,6 +522,10 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
>   
>   	packet = &queue->packet_buffer[queue->tail];
>   	packet->exception_number = elem->exception_number;
> +	if (elem->context.el_valid)
> +		packet->el = elem->context.exception_level;
> +	if (elem->excep_ret_addr)
> +		packet->end_addr = elem->en_addr;
>   
>   	return ret;
>   }
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index c8a92b5dba6001329d68766d540b9b7ead90e9e6..a40b3b2fe2e6318154111d9b7ebd05bee53934f1 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -2019,7 +2019,7 @@ static int cs_etm__exception(struct cs_etm_traceid_queue *tidq)
>   	 * to generate branch sample for the instruction range before the
>   	 * exception is trapped to kernel or before the exception returning.
>   	 *
> -	 * The exception packet includes the dummy address values, so don't
> +	 * The exception packet does not describe an instruction range, so don't
>   	 * swap PACKET with PREV_PACKET.  This keeps PREV_PACKET to be useful
>   	 * for generating instruction and branch samples.
>   	 */
> @@ -2225,7 +2225,6 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
>   			       struct cs_etm_traceid_queue *tidq, u64 magic)
>   {
>   	struct cs_etm_packet *packet = tidq->packet;
> -	struct cs_etm_packet *prev_packet = tidq->prev_packet;
>   
>   	if (magic == __perf_cs_etmv3_magic)
>   		if (packet->exception_number == CS_ETMV3_EXC_SVC)
> @@ -2238,8 +2237,7 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
>   	 */
>   	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic) {
>   		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
> -		    cs_etm__is_svc_instr(etmq, tidq, prev_packet,
> -					 prev_packet->end_addr))
> +		    cs_etm__is_svc_instr(etmq, tidq, packet, packet->end_addr))
>   			return true;
>   	}
>   
> @@ -2277,7 +2275,6 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
>   				      u64 magic)
>   {
>   	struct cs_etm_packet *packet = tidq->packet;
> -	struct cs_etm_packet *prev_packet = tidq->prev_packet;
>   
>   	if (magic == __perf_cs_etmv3_magic)
>   		if (packet->exception_number == CS_ETMV3_EXC_SMC ||
> @@ -2301,8 +2298,7 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
>   		 * (SMC, HVC) are taken as sync exceptions.
>   		 */
>   		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
> -		    !cs_etm__is_svc_instr(etmq, tidq, prev_packet,
> -					  prev_packet->end_addr))
> +		    !cs_etm__is_svc_instr(etmq, tidq, packet, packet->end_addr))
>   			return true;
>   
>   		/*
> diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
> index b81099c2b301c25f894cc9a50edfde87aceff49d..4d03f2a680b58aacd91c9f6c957fb2d38e7ac2ad 100644
> --- a/tools/perf/util/cs-etm.h
> +++ b/tools/perf/util/cs-etm.h
> @@ -174,6 +174,7 @@ struct cs_etm_packet {
>   	enum cs_etm_sample_type sample_type;
>   	enum cs_etm_isa isa;
>   	u64 start_addr;
> +	/* For exceptions: preferred return address, or CS_ETM_INVAL_ADDR. */
>   	u64 end_addr;

Minor nit, but you could use a union. I don't know how clear re-using 
"end_addr" id for exception packets is when reading the code.

        union {
            u64 end_addr; // Range packets
            u64 pref_ret_addr; // Exception packets
        };


>   	u32 instr_count;
>   	u32 last_instr_type;
> 

