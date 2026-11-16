Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869074;
	b=2FpM3oT5QgfpIbmk9oSF61fn5qR8qytXHUcfhpzOimQrzI8Mg4tdGbGRdCUB4yJOpur4
	 rTr0pdo64o804vXNV7ZgQu+B15yLwsVfiWRZG4UTL4itN3lwJ34PTbHeSLgNfXutaPyis
	 qErQbljSnr35lT8DFGWrEEoxDH3BxTAH5xQxQ/pFa5v5GleDqvgy4EoUrLW6xrXLbh9sj
	 w8WAx5e/uro/Zgn/6nmJb/CpYC132/7lTfic9X9zplXopodwfuK6dKVPtz67giXkxgp2O
	 b4hpRu/SlQ4+T7EfeXstxDRRAkPyRvDUXDVvN5Fjo/hweME0K3r6VGD/jNuk25JqsXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869074;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PiHlbasaRq9CxNwsYQ8FknTTDnOGi1ojon+jFjUssUM=;
	b=uTryv4xLkB+a+XyjLjo8MiAWaPZ9f8P2NXF88ino+5SJRbOxsOWDLB1hG5/jWvtNt8rO
	 FvpIlRfxQetygXPiWfpa1stAJ51ASyjFv4aR+ZjFRQerhZsGH56udfkHetXsxvEHy+5SF
	 EV4Mm3WCvGwLFhsn+vS0/vv+GT9tdUh2XK7HNmqGAeDQzmJGepB4IBW/TmeUz77QYvAg1
	 SPve60lvmpI+iyqMYJo9NeglsNqE2GUoxDinR1t+Kw7yztyArc124PHNnCiv5d4jv5XF4
	 VvcIlcPZw/WVU4vtPL3lyZdL0wyFZpuKej+dfoAKAgeIK4Ao0E7YXXvGUqpuk2jKfXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nonDLTi0;
	arc=none smtp.remote-ip=91.218.175.233
Received: from mta0.migadu.com (out-233.mta0.migadu.com [91.218.175.233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F72606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F72606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nonDLTi0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ct7oxqF2sOm4fUOjgn+XVgshKinezzgwck4BVRCAtTw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794869070; v=1; x=1795473870;
 b=nonDLTi0miN2ikVWORa14ROZ7TLO0ZYOnjs2vY19PKeR/vznBOFp1JYpfWH2o89P53Ir1Biu
 yvnQMcmB1V4MT6J7Z2k6vJ/5BjKbprs+EK7wN/lCNNHrjEkC/6+/a1X6mx58tP4E6OGTFpfGyT6
 SwKWxtBaLjXhEz7TM852nrXo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 21bbf8a4d822fef4;
	Mon, 16 Nov 2026 22:44:30 +0000
X-Mizu-Trace-ID: 21bbf8a4d822fef4
X-Migadu-Flow: FLOW_OUT
Message-ID: <308065ca-f4db-4b7d-a6c3-60f4d8b868dc@linux.dev>
Date: Mon, 16 Nov 2026 15:44:23 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailmap: add entries for Luiz Capitulino
To: "Luiz Capitulino (Red Hat)" <luiz.capitulino@linux.dev>,
 akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
References: <20261116215756.133593-1-luiz.capitulino@linux.dev>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <20261116215756.133593-1-luiz.capitulino@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/26 2:57 PM, Luiz Capitulino (Red Hat) wrote:
> Map my previous addresses to my linux.dev address, which I'll be using
> for kernel work going forward.
> 
> Signed-off-by: Luiz Capitulino (Red Hat) <luiz.capitulino@linux.dev>

Acked-by: Nico Pache <nico.pache@linux.dev>

> ---
>   .mailmap | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/.mailmap b/.mailmap
> index bb8cd0c84747..88d0f83aadbf 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -589,6 +589,9 @@ Lorenzo Stoakes <ljs@kernel.org> <lorenzo.stoakes@oracle.com>
>   Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
>   Luca Weiss <luca@lucaweiss.eu> <luca@z3ntu.xyz>
>   Lucas De Marchi <demarchi@kernel.org> <lucas.demarchi@intel.com>
> +Luiz Capitulino <luiz.capitulino@linux.dev> <lcapitulino@redhat.com>
> +Luiz Capitulino <luiz.capitulino@linux.dev> <luizcap@amazon.com>
> +Luiz Capitulino <luiz.capitulino@linux.dev> <luizcap@redhat.com>
>   Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
>   Luo Jie <jie.luo@oss.qualcomm.com> <luoj@codeaurora.org>
>   Luo Jie <jie.luo@oss.qualcomm.com> <quic_luoj@quicinc.com>

