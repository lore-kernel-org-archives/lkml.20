Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987144;
	b=sncPMqWVMPXW552mXnkVwOGoZwbtCyz6aUbBWPPn5pHH6p9toyxyhdQMZgpg4vPS60sj
	 CD7f+q22hcUoUEmZ8ZKVW/K5wHhohLStLvC9y0Kqw7ONlhmvLA2g/nzSZP/SEQhoy7rVe
	 T4DN/v0ix/rjHYGEA90mkn3ksKuxmgvYd/FwiYyLCiKpgEJITfoJ9HyPO0KVGCH+gBZQp
	 //vEqJr8VbA2Eu5MQy+7vDIn8Lon8NXi5XyrOlpSUGF0Pngc9ase0AncLizLjIBwpu0QZ
	 x32NMXTCZlPywPqeyyFClT0OLkPhUYip0WRbBGCaG2n0AmgXnLUviPGERv7pS29y7Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pNy85i5p/kZFaiV09mmGXuya5Dll1WpFZO2LbU2jQl4=;
	b=d5EWxAPnnnjGohQijjUhfTgBpD2gXTCOb/xrCHhlZi16QIjg/LsoEuExGGtoCKmfSqGd
	 d9io2MPYRT4T/n/HldeZOuIzzxTXAxc/0k9bJrJ1fzntIvJtpN5WmRm7yvAK83BT7IXQ2
	 ZsioHOrtOyFDUffTZrHpvWl3KbBjzrNt1NYHwRwMbeF0J5g6M5b0D3B9zVvTpgpRYnnDK
	 1Pw2KSCuWYxcZPJ920HtDg/SFEnbxoh8ItgUgvkUQFjR54WfSTAWT9sij/aaW7k8fz1xL
	 2B6K1Ej3NVDkDnph0kPiuzRzPOhXyRoDrOHqCYgYsy0T1imCzQc4m/zvu8yKEP56vXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=A0MKTtiU;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1156B606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1156B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=A0MKTtiU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e09aa5264so526133f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793987142; x=1794591942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pNy85i5p/kZFaiV09mmGXuya5Dll1WpFZO2LbU2jQl4=;
        b=A0MKTtiUb79Thc6NLyFsY3/Eq2XQfR/u1c9cdUAwVgPQeCCVMhkr49kfrzUEbKwwr3
         X/yIYvVokUEa62Aln+YhlpKP5md6g+5ToFbrdQ8ZDzjnzImdfaxi0fb2nb2vQFh9xWPI
         zORe+mTldvjjvWFs45/yfnOgTfZZ7OiK4U+KEdtGF4TxXjc0Jip+VW/2+KPKL431JUTC
         cQC3TegL+rOMa8WFNDlqE32oobHWphe7nxzw3WGHE4P2pvc7oZeG8vSv81a1PHnfd/nf
         Wd5xN6Yr6Vn57ar/tsOwZsEkYTwg5tL6PWlBZ64ZOKvnCtzpAkoR65PSCAqYaFsOyDrA
         kkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987142; x=1794591942;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pNy85i5p/kZFaiV09mmGXuya5Dll1WpFZO2LbU2jQl4=;
        b=vH16oCw5JtJAQ6ASqhfx7aG74bkZFmT8XRaLuY70xg6i0Yy6tG4NL8KZSVqVikvVfV
         z/87CSCv5xtypmZqmq8UCr9zdWjeFWGRTvoT4hymtbrSQj1ea/q630eLIXp3ru9rBJV7
         56jf8q1cXNKJOsnYsOQjnOnCpW6MWjwASo7TdB1xnANX/7vfsgD5sn1sILSjms120c8k
         g70fC/ctHZ8l2JMNH4I0+JRO392r8hJfrczL/GUmBMYdM/m1OmNilr7uBd3XDRnuVySd
         el2x8XhT9jFPL3yeeHuKNLfFkH1TvpECkBFOZ7UFwNLeQeOMRpjtzirPFaZl0Y/06zsZ
         Ef2w==
X-Forwarded-Encrypted: i=1; AL+hErF0RQ0jb3ShpJyNF3SjTYLaO93p4rgQXSd8HZFaKG/ZRE44heZ284L6bA5xxQJYk2l/uLSZBlVZ0QgRBNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xfrI89mRU8iLHK6rS+2SBjtjOcwL5IYIYNSY2EC8la5L11YnK
	0HAuD09k2Q7TMcM3GWmv3/O2/CkWQlmUqxpHtbsJiScE/MFGB+DW7ewrtsfnzpBXUHM=
X-Gm-Gg: AYBFou1iTEPXLOZrX5QFTE4M/5xPB7tCATN0eUwIVuwQ4Jet+BGiSrYCOPqGfhof0HW
	B9dMXGJdFO+itmRwQAWLhtz+XBQ0bY5x3yq9YQV6Yk8m3Yw3KDj4pONgLx6PSc0fnAsjlcr0LIO
	dIuLFSatervfP6Gb/2mXNuViv7sCmhSaMnP1OB8dk7x8xeSsx4wR/t3PdwNrWodJ6YEdyGChkLB
	dsw6hVWeePFSiqFr5uTfMyslopWtLR5bSNQjAvkPk+MvFF9mplPHp9y74cSdPAoaCtqmtJgcubg
	AcQUKp76ZG6ZYdn3/CHeuLnLeMDzwn4e/3tDXAWl50qLke0j/sC64LF0SqM+4+G+81CMVj4TGZQ
	Jnsfp6TQsLJIOzUU02a6mZHZ2EX45Qwi+4zp0LI1iE6vPxpuIzF8gcKZR+Ijk0jS+xuF7OtuG6o
	YDPN4FdL+nYpxK2bpERpIuKRISMUPL9G2R3kvy4uNbFWftyKnL00fxOnQ1cnfZmCpQbWkmqSxgR
	Ic1P1ReWFhqIW1N+wB9VTIyVs1x/q/GTx8INNLzCdqvl408eYmztoiBEcDfGFdDJAGsSQToe6TN
	fQVRu14tnzAalD3qq+n2a9EQcoCCYYQ=
X-Received: by 2002:a05:6000:4302:b0:48e:7470:9eb9 with SMTP id ffacd0b85a97d-49277f8916cmr5896371f8f.43.1793987142410;
        Fri, 06 Nov 2026 09:45:42 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7232257sm3717802f8f.22.2026.11.06.09.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:45:42 -0800 (PST)
Message-ID: <0fad8193-bf8b-4d58-86c7-f57dffe1e3c1@suse.com>
Date: Fri, 6 Nov 2026 19:45:41 +0200
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
Subject: Re: [PATCH v3 3/9] stop_machine: Introduce
 stop_machine_nmi_cpuslocked()
To: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, peterz@infradead.org, david.kaplan@amd.com
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
 <20261015211426.49114-4-chang.seok.bae@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261015211426.49114-4-chang.seok.bae@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16.10.26 г. 0:14 ч., Chang S. Bae wrote:
> With the NMI control logic in place, introduce an API to run the target
> function from NMI context.
> 
> Originally-by: David Kaplan <david.kaplan@amd.com>
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/lkml/20260202105411.GVaYCCUygtEUNrMUtG@fat_crate.local
> ---
> V2 -> V3: Address Sashiko review
> * Ensure runtime only via `stop_machine_initialized`
> * Ensure target CPUs online
> * Add a fallback prototype
> * Adjust function description (to align with mainline changes)
> ---


stop_machine_nmi_cpuslocked() is not referenced until patch 6, so either 
it should become patch 5 or entirely introduced alongside the changes of 
patch 6.
