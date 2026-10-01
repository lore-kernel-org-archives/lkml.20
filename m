Received: from mta0.migadu.com (out-76.mta0.migadu.com [91.218.175.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A363B38DC66
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860331; cv=none; b=eXzt6R4pnlTCA1aXjmmpA6hZyf6juxBujmEc3n4sG5ta5CIuk4pcWtiU6xsv4Y0TcLDm/gd4WCP7sdBvZj+2E0tq91+lJrWIHrAQvD10ZRh6tq2OccUPd5mte1GL1I5KpCXs0Qt0zysjux1YHmmT8KP0zglx/j1k4rYu2xpCcu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860331; c=relaxed/simple;
	bh=qPY8F3aZkZdZdkDBNIxoLwQnRsRRPFn4RgfhzHvta1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rm3qJytjzVOidlHHCHxdKCeOHZiBizHifrEDvGyl6SKzqTmKVeMiFvw2+7wmuYcfHvMTu6aJNpPc7DXvqw0uEe6qULMZBNhjFvxqqyJI0ctE0/m5HRb8hig5dIXv5XxXsstRh2ltoyB0njP+WRpYvRvnhHNxnec5MdHAjQOmjf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SmBASrSP; arc=none smtp.client-ip=91.218.175.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SmBASrSP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qPY8F3aZkZdZdkDBNIxoLwQnRsRRPFn4RgfhzHvta1I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790860327; v=1; x=1791465127;
 b=SmBASrSPAfbuVs0AnNOir/1kX+AHHUEYvP4F+y5ZMUhwQA3n2n/1sM5PgbUqku24YRmeMLj7
 muxibveoKEOYQ9JQfKAdR6lU7sJryt0OQ3Ot/Cgp2VGCS3nmbl77nOvatv9HqqlAysCdE+sCt+7
 SXTTOP1WTdh8indBT/Xf+RzQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 938b5478a2440141;
	Thu, 01 Oct 2026 13:12:07 +0000
X-Mizu-Trace-ID: 938b5478a2440141
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba40832934so6941e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:12:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgv4/tLT9zZ7+eICN7O2d84L+VLQbcheGC0LloJwk3aIA+EguC1z1szA2OwrP2dy1QOXuFWYR1obCEObI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeQD4PB7VbQawKYoCCN8TPPmuadI30SgmjYxMjRs/uftcjQhjW
	gQVRgZOQEKKZZvSC01VrpL37VS4WGCQJxPCQ+NOddj9sztL40yPDc7ce0YB578YCfDhWAOsQyLO
	lO298BJuubt+9kZ69vPajcBEibsuW16fBR6uQ3CL6
X-Received: by 2002:a05:6512:6411:b0:5b8:f20b:350c with SMTP id
 2adb3069b0e04-5ba43805629mr146508e87.3.1790860321116; Thu, 01 Oct 2026
 06:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arK1tHUEJsCQEKzn@google.com> <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
 <arTfjgvZIhmXLrw1@willie-the-truck> <CA+EHjTxe0JE-tCX4YcEEafdnxjuZLj3EBucZfZF0HCP2PQAekg@mail.gmail.com>
 <arUUCFHamX1nOrB1@willie-the-truck> <CA+EHjTyWDvVc4B0mF8+N3QJ=gVPGEY-pxPGZWuTLK6Y=PZnF1w@mail.gmail.com>
 <ar5Y2Usv-t0FggVA@willie-the-truck>
In-Reply-To: <ar5Y2Usv-t0FggVA@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 1 Oct 2026 14:11:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz9DYGa0nZKRFL9ADW6QteugRyepdvE0Q6qJRUsbR-MYA@mail.gmail.com>
X-Gm-Features: AclHuK91vl67_Aq7uOGWFfqQ3FxG97CsxRtiah5XT6CIp7Z_3LPr6IKz4T7UkZM
Message-ID: <CA+EHjTz9DYGa0nZKRFL9ADW6QteugRyepdvE0Q6qJRUsbR-MYA@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
To: Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Thu, 01 Oct 2026 13:58:01 +0100, Will Deacon <will@kernel.org> wrote:
[...]
> For the benefit of everybody else, we had a fire alarm in the office
> yesterday evening so Fuad and I sat outside a bar with a beer and a
> piece of paper and went through this together...

Memory ordering is hard work...

[...]
> If we address (2), then I think the sequence becomes a little easier to
> reason about. The OFF->ON_PENDING transition on the requestor looks
> like:
[...]
> which I think makes sense. WDYT? If you agree, I wonder if we can
> include a comment similar to the above in the code?

Agreed, and thanks for going through it with me (and for the beer!).
v4 already clears reset on the CPU_OFF path rather than on guest
entry, and I'll add your sequence as a comment above
pkvm_reset_vcpu().

Cheers,
/fuad
