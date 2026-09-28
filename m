Received: from mta1.migadu.com (out-229.mta1.migadu.com [95.215.58.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF14EA38E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617650; cv=none; b=AXB90HcnoHwmoNZY96oYQuvRKnGfbLaXCfv21jlJx9FAujgyE3byOrlHx7j6/OTBrG1xYmsj8hf2iw07/4JM9DNdn1gXLlXOX+6gC+U4nD2bzi8EvWnnnyeaeJex/hFwow0r/bfXMoP7gAxIIRu9t86fhmkMpFMAMnWPi5BzKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617650; c=relaxed/simple;
	bh=XyuHMcU9BbS4rZO3qSAgRdBv7BTX7Z9PJ3I+SxV2FeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEnTn775oMoojVylitnmljyN4b2AwboBx+BHZIOaebma1zAY3ge4pd9JCcQ7YsbTrXwNh6KkyIXd75mv6rMk4S6conyzAS1VT82R/LXDN47nSKgO7jkGkv0ETpcDriUBBQeguTMY7D7SW6wfMt5I6FI6Qf/pdyNJvJAmm1EzQgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MhExsRLC; arc=none smtp.client-ip=95.215.58.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MhExsRLC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XyuHMcU9BbS4rZO3qSAgRdBv7BTX7Z9PJ3I+SxV2FeE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790617643; v=1; x=1791222443;
 b=MhExsRLC6gtZauHlznNS0L1JU/j+3gnTSvi5os1hghOGMcg6M4xIdxpryUEw4l+w8hrTsutZ
 nGp8JAzcCXM9+jRYv0mRePcpWVfi3YCnv7VC6AKiga6bi1+mRUPfQQEZKf26BpHtzleB/4nPTNy
 ScYO0p6qqm8y1d57Fkq9OkLs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 526bba748abafdf0;
	Mon, 28 Sep 2026 17:47:23 +0000
X-Mizu-Trace-ID: 526bba748abafdf0
X-Migadu-Flow: FLOW_OUT
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ab0140ecb2so1201a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:47:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLjF6UQOpc7EtIDGCXpt7uECtMohGXTzMQNVJRd0kP+z8WoA63ep9/Jt0eWW1ipPOB/lQ1CDzNRS77kaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtiOR65qZdvqA+l8BIClCWXigdC6FbG1qiMGmjaN0CA49s9iZ7
	neOd/iPtsnULM9EMN6oL5IwgMQah2k2UoG+4AolEbYvfa9r8aLRYQa52MX4HEbmPypqdLLeDwPu
	GaY1xxVhh8e7VfKW03tACyZVrU0e+7y3E9DhFR3cG
X-Received: by 2002:aa7:ca57:0:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6ab01ed939fmr94944a12.2.1790617638152; Mon, 28 Sep 2026
 10:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-5-fuad.tabba@linux.dev> <arqaNHGzVfMpVha5@kernel.org>
In-Reply-To: <arqaNHGzVfMpVha5@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 18:46:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz=sKCZpQzLkMaks0o5hR-R=ACKVinPgwzAiyVUubirxA@mail.gmail.com>
X-Gm-Features: AclHuK-Tq_Aet2hB71IGOYbMLUlrt7UHvVGW8T4ukejDyUoOFxO6nR4iiKf3Ohs
Message-ID: <CA+EHjTz=sKCZpQzLkMaks0o5hR-R=ACKVinPgwzAiyVUubirxA@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] KVM: arm64: nv: Return a failed stage-2
 descriptor read as a fault
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Mon, 28 Sep 2026 17:47:48 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> Hmm. Rather than fixing these things individually, I'd prefer aligning return
> codes between the S1 and S2 walks. I agree with the approach; negative
> return codes should be reserved for host-visible failure reasons whereas
> everything guest visible gets communicated through s1_walk_result /
> kvm_s2_trans.

Makes sense. I'll bring the S1 walk in line with that in the respin,
with the Data Abort change on top.

Cheers,
/fuad
