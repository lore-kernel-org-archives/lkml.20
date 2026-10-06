Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6923DDB04
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791320958; cv=none; b=hThVlvHQ3v5N5mmhBePCvbFw/P4OjfZOoY+3O7QSHD/8YGCKzykonR90SUBa0Y+Pr1AbabA5Hddwq/H8Z9YwTU5802PriF1niIrWxpwHsFTpXlCtHSs5NoJndwpOIIDsWboIaTNNU0JszWP2n1UVY62fp0lC9GLuFKRVjwcSyU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791320958; c=relaxed/simple;
	bh=IqqcV0PdW4B7ApPkpQo3qGEBUmFx4ZSSdd3D5Z7kQWo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZxbOkDX0EziEs+AnzfW9JPBiPMdIKpyEeC9yTg3tFcaw5AZR0Jj0LaX+jBF6tJapWjl3DsGXpFVDWitfJykD5WVaEBRkahAaWSxq/WhxAOcs0YWcf7ZnLhVKhILwXlN7+4ZYc5AdnflLzw9n8acxxWn1hdgV1Ody3g83XuxX21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--shansinha.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PRl1spq7; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--shansinha.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PRl1spq7"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4a053dcadso3086411a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791320955; x=1791925755; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wbyToYEPWxDXDtMyT8pdC2lUf9GpIF5kjZmHiyIlig=;
        b=PRl1spq7RJZKPt801SLJiWliUrRwxea4u+CQ/PDzwupfVQwcyv9QWmFx+SZKG04OBt
         srvDcdwOZdQRFYC5ygaiv4cO/ALMK/4M3SCPjmNGcUbqkU1FAHT65ULifBVXJ42K+UvE
         cQstZgtX2qwLLqFFcr4odl8789rNLnOveHMRaAvrFPLgUToiL2++PBTorcqrPuDEqiNm
         n0A7NskzUB46jSvaMNxwwwlKQxGqQOHy6WTMPZy8OD6TzukGzBNU2jIcNHnbC0gahlVi
         uZpuJ3WlI0hw+A9tE0DVs2N34M+8dvJGnIyWnoejX21aZ8qpm6HoqovCKlar3tJ+6/uh
         SIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791320955; x=1791925755;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wbyToYEPWxDXDtMyT8pdC2lUf9GpIF5kjZmHiyIlig=;
        b=m88N5+bDkheuqPct6u8QLGNW7T7dwu32VJrYY+0dni/2GWnA+yYcyK+QSWrpJ/KPns
         x0TsrR77lWehKivoaRervX9g8fyTuNiGvQy5CfkxQEEGAzKb6Vp5spMQw9hOlLBe7DfN
         jFsjzHzr9KNtIo0xJlmsz6UHpfANcvi3ogHJJ/8bkP/hhPxEFDLRshsQi4tgZhTOyUWi
         wq5WnjEHYDw9HILrCe0uNPydjevC3QWGujj+ssuuMFHJZqj9ed8QvZ5E3U/zCS7r9+KE
         tb87eD9tMQbTs0O1u66UKmlCyOsX6hzdr0KPBtI/HdzEiUlMzN2k6eyH85zfBln/cmOL
         BgCg==
X-Forwarded-Encrypted: i=1; AKwUvByWC9f4YA9LI4KwhaLsoEACq+GQp+2KjA1YD/U058FahtVmA1J6hyzVsK9Da7WhixjWwcH4I1HjGogxoRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVB33ad8klnROAXHhGWu1WLNxUMvvwDhe1lCTyQtMMntrl6njl
	OpID6HzeFGNyi7wOvEg0XkAxvbp8h6LAcn4imsMtkxNgF0DwZAZ9zrSnym+r7029wbjEedBz1W7
	UWZs/G7QzQIqyIWjG0w==
X-Received: from pjber5.prod.google.com ([2002:a17:90a:f6c5:b0:3a7:ee5b:a8df])
 (user=shansinha job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c47:b0:3a8:5fb7:669b with SMTP id 98e67ed59e1d1-3a8a13d7f45mr286698a91.61.1791320954996;
 Tue, 06 Oct 2026 14:09:14 -0700 (PDT)
Date: Tue,  6 Oct 2026 21:09:14 +0000
In-Reply-To: <c3384e1e-6fa4-4b3b-aaa5-a325bffcd10d@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <c3384e1e-6fa4-4b3b-aaa5-a325bffcd10d@amd.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006210914.2708183-1-shansinha@google.com>
Subject: Re: [Patch v3 7/7] crypto/ccp: Implement SNP Download Firmware EX
From: Shantanu Sinha <shansinha@google.com>
To: prsampat@amd.com, thomas.lendacky@amd.com
Cc: mcgrof@kernel.org, russ.weight@linux.dev, dakr@kernel.org, 
	ashish.kalra@amd.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, chao.gao@intel.com, 
	aik@amd.com, tycho@kernel.org, nikunj@amd.com, michael.roth@amd.com
Content-Type: text/plain; charset="UTF-8"

On 10/6/26 12:55 PM, Pratik R. Sampat wrote:
> On 10/6/26 12:32 PM, Tom Lendacky wrote:
>> On 10/6/26 11:41, Pratik R. Sampat wrote:
>>> However, a fresh allocation with SNP initialized just goes through
>>> rmp_mark_pages_firmware(), so my understanding of what the new firmware needs
>>> is the reclaim -> make shared -> mark firmware cycle, not necessarily new
>>> memory.
>>
>> Sounds like some good info to have as a comment above the call then.

I had looked at cycling briefly, but it gets tricky. If we reclaim the
pages in sev_fw_upload_shutdown_platform() and re-init gets skipped
because of RESTORE_REQUIRED or a dead PSP, the buffers are still
allocated but aren't marked as firmware pages, so all subsequent paths
need to be aware of that.

Reclaiming after the update avoids that, but relies on the new image
accepting a reclaim of pages the old image's INIT left behind, which I'm
not sure works, though I haven't tested it.

In either case, failure handling also seemed tricky, and the fallback
would just be free and re-allocate anyway.

The only issue I see with freeing is that the TMR is a 2M buffer that
needs to be contiguous. If the new allocation fails, INIT carries on
without a TMR and without any error (it's only logged in dmesg), even
though SEV-ES is now disabled. It should be very rare (since we did
just free the TMR and can probably get the same block back), but it
seems worth mentioning in a comment.

>> The memory holding the firmware on the call to the ASP has to be
>> contiguous, so you're likely to fail on the alloc_pages() if the image
>> is too large. Up to you if you want to keep it.

I think it's better to keep the explicit check and error message. If the
size check falls through to the alloc_pages() failure, userspace sees
device-busy, which doesn't communicate the right intent.

One other small thing. If the platform data refresh in
sev_fw_upload_write() fails after DLFW_EX has succeeded, it returns
hw-error even when the PSP is still alive and the new image is running.
I may be missing a reason for that, but would something like this make
sense?

 	if (sev_get_api_version()) {
-		dev_err(sev->dev, "SNP platform data refresh after firmware update failed\n");
-		return FW_UPLOAD_ERR_HW_ERROR;
+		dev_warn(sev->dev, "SNP platform data refresh after firmware update failed\n");
+		return psp_dead ? FW_UPLOAD_ERR_HW_ERROR : FW_UPLOAD_ERR_NONE;
 	}

Apart from these, everything else I tested in v3 works on Milan.

Thanks,
Shantanu
