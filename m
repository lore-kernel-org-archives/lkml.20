Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673382;
	b=boP1C6uU1Ob2VzjeKV9Sd6JHnhQigMD0L0KeA9hNUH/pa9Us59hUvX7wR7Ojd2nAyuFg
	 xwlRQzQW/QZrD7qFA6OKNHKznmUFaqIFtmWTHjrTaKDTmLu268W1lNBFGCdZjncr7Emru
	 3ug3HEApttFlQX+jAZ/DEoT3PV/PvuvFWkOpzTkbca6aeKqdxpbmuNZ08LNsribWK8VnA
	 qzD2QTOczP7Yu1fJHZPyl1x740zqud3orB+3BTxT4AEwzSlDYs59rdM0ddJ61jXAgv/Xa
	 wPLd7/+n3NICHZxJMfYHwzuJobKiBYk+g9Xwf8a2cOzhCxT8ck4H4WdueYppZv8GGaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673382;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=QvR2u7W5gGpna7paBb3zjwV+s04vzn7FIqIkuyCNIqg=;
	b=uvtyXRzfWi11DfpDXUQOiHsLjcyznJy2aYtS3S202q94jyXdKgGlKYB1I//O8LNlapj6
	 tMrM314/k33pCUDU2xoc5aXFBPJnRs0xrwBcIKL+2IR+Y82eXZkSWpAU4xYVX0Z+YGwSg
	 9cltPxFpVARmevR6Ahv5ccZNgvnCJQTZiiAWG0CsRflswpMzmliZDOto8V+JPNUHWoK9Y
	 2Bk9wNAh1S6v3LwhC5cIu9szW7h8GqG3ldOjNS7BcsbAQpw7sQ6lNiJpU92R4wR9v1Zzz
	 OT7p7388NHI0mxuM5LkEorYaV4xvfz973rDx/Ej76kbgANuBAExKtviWQbLDX9KrE8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VK1O6LxY;
	arc=none smtp.remote-ip=91.218.175.149
Received: from mta0.migadu.com (out-149.mta0.migadu.com [91.218.175.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699C5606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 699C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VK1O6LxY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QvR2u7W5gGpna7paBb3zjwV+s04vzn7FIqIkuyCNIqg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792673379; v=1; x=1793278179;
 b=VK1O6LxYfzRvZz2nCpTEuQxeJvoqNLcra8xD+COo1SgMM4CD4Nxqk85yMVdHx3l4Z53PvLJK
 8xcTTdL2FbnGmmdwdt3ttDCILEmN2DOofvxIhZJ4UmZ+kp519dB0LoQL/c9jiXIECxo4FZKrIUF
 qZ7WC3bo+TGqFO2gY4GSdD/Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a6073eb1bc924ee3;
	Thu, 22 Oct 2026 12:49:39 +0000
X-Mizu-Trace-ID: a6073eb1bc924ee3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8950e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:49:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz56a+IN/K4vgpIxsZZkEHQmzgZjm7nT/glH3BuLbNxdqubCuEaV7iDhqbLlAIbgQdfEvHBJ63DZmtdAPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsFYXzE/skyFcBugTypMgH9mnbe20QS318aTHDOvUw+YDqYkBD
	TGxnC2m+pggx8fvLIyXZJqx7Bqk06eDBTVw4EP6dfSgKIp2rFe1OuRNXwUo9vyw40ZpNxkRFJib
	RTQoKqgsS2LdjbKkSLRJ2zS4z+lexbqNKF+dL0jeD
X-Received: by 2002:a05:6512:10c3:b0:5be:58ad:1ba4 with SMTP id
 2adb3069b0e04-5bfa8491692mr166044e87.6.1792673378383; Thu, 22 Oct 2026
 05:49:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022100319.3046476-1-fuad.tabba@linux.dev> <86ik2uymnc.wl-maz@kernel.org>
In-Reply-To: <86ik2uymnc.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 22 Oct 2026 13:49:02 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzo+NoM0m3cjuVGW0EZjuzRt3pJvwFC5QO6=g8AYTC9pQ@mail.gmail.com>
X-Gm-Features: AclHuK9FL-kWa8J9l8GOe0KfCzxWBz-UvvDfr9Sh7jKLeEaBWko1cn9SH2Ay8_A
Message-ID: <CA+EHjTzo+NoM0m3cjuVGW0EZjuzRt3pJvwFC5QO6=g8AYTC9pQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: nv: Don't WARN when L1 sets IMO and FMO differently
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Thu, 22 Oct 2026 12:56:07 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> No. Either we fix the bug, or the WARN_ON() stays. There is no
> alternative.

Ack, I'll look into emulation instead, after -rc1.

Cheers,
/fuad
