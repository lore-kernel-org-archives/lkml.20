Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B8478E5B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932621; cv=pass; b=ZWBpGaqwVeqm41F0PwrRh/2EEK7iSQHmQs76hGAufkcDd6oDHX6IUW9Dw/HzU7N3dDL77xbMvfmHrSSWM8dYZ8MpmD3un2T0lCgjkl18xBh+ev+sVCjFVgEMWX/qF8XGUDx54PqosdN/nGAM7jS/nD+Ca2ombpevOaSXdqqrm3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932621; c=relaxed/simple;
	bh=YiCPzni2Wl6GvelfU9cy/yhPEZ/U3/3S99KBiab8N+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzEjNIqiEJJlYc3eBbLUJyvrgylUpyFBEp4l++JEC/ABs3V0z7zgtb4IskK0YEWOUpqXcwcuGF0kt1YrNWLJc4ar9trkRxCqAz3GfnQ1Irx8vBQv0jtrTZBHld6ssYjcK+9WhRngrvTgUW/hUDLPUPmLcptxfv8N6u5jlPjk/6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH9bqL9e; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH9bqL9e"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso1100235eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790932619; cv=none;
        d=google.com; s=arc-20260327;
        b=NUouwn+byfZEVimt68Nwsz1y5M+VLBVasvVjPMW3fhfqTV0ojC+6ktfNOHjQps4B1+
         sLN6v4xkMMue/wSMFDZeQgef1vjNbFc/OzO6Ohsn3yQ2ahEFQo4xsTwvD+UNthfYEsjM
         t9myoGwi5VwP8zXq7aGVXCtryDJCEzCDMOL1ZQeolXpLYI21NafNnISlK/9IPCbrmk5j
         vrWlGtpw38QvQbI7EkW9O1/ypr6H++vb67Oq5E4ohp6jEr1F+2WJjQpH7lsWHYinrrCR
         sxTiXkuXw76GLc8AV2HtcGrG2TdKYUwIAPGuD4nQUX7AEL0s13/m8t20J3QLtdzoHiYK
         CZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YiCPzni2Wl6GvelfU9cy/yhPEZ/U3/3S99KBiab8N+Y=;
        fh=JuY++koK6/61A1hwNRuAUVVIY6yCi+JdOGp8kz0wGUw=;
        b=eKX/kdOlzsTrFBsLMQCxsdj8b619A7wS73J9/Akt4bsuvKc+61g85Gz4H/OoyqlDAa
         nnM+gmeYXHqzPYsG1tU1/rdvncVWpjP6eNBI2fEreMXkvpiDArY+u0yNbQnm5WG+K/BU
         mj96qSFdlzexBgyagFtUqe0IMVQA2CRgX9LS2QE6EoIj1TJIJKJHgU93bop0nCnSCsAG
         g4YtYFYHMz94S54mE1xBvZvMkCGwD+aL3eASaFiSHuyvOxpEm8JtvD5OO0NxaGq3OElZ
         RDSYVWOPnTdj2D14OjVDEO5nNTpKixQE5Hrii/5PMNa5u54FgkfSuXuUcdyY5gmd5HE8
         iSIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932619; x=1791537419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YiCPzni2Wl6GvelfU9cy/yhPEZ/U3/3S99KBiab8N+Y=;
        b=eH9bqL9e4sxWU66/AM8dyybpUwX7jkVs6hwrT5nNxc56+DqMJEhHRz/0G9NdVCKDT5
         OyRcPKB3Gkpr72QuRJSvJN0v56v3AHT2aB+eu2GMRo1H9wJVrMgo62V5+x/H1xnoY5N0
         oQr5srVSgbcNiBZ9maIubuzRb5peEy7VMVqdqeitHU5egwpR3FBjlXjDsd+AXWdWtOgr
         K6AJIHWqgDSkPVdu5RgS6hMVi3D8QnKF26PMQT9fT/a4aRlO13fOps/92B00oD4NOJf4
         Pah/UuflxyuUwHLibTIPx/JwLbcBrM+GWPibM6vt+YvEmXdLBuBGqoZXFE5FJu7RIrIL
         3agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932619; x=1791537419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiCPzni2Wl6GvelfU9cy/yhPEZ/U3/3S99KBiab8N+Y=;
        b=Wc6cCfgxg+UdKPopM5CEHeJO3K2pGB0WFQhJEzaiGMIQ1ttehRIHBaQYPGENtzxdq6
         P+McwxQ22DitEsYX7DKRA266JZE/v+tykKaRJdctruZaiiLfXZXH5CUePxPwoREpsNUa
         puANXJ6nt3Nf0+moIMUCbrXniFwTY64EsKTHTVE7SAnv4mn+kPv5IU9Xrhhuip0Kr+1a
         bvAuBjj8cY1dyZM6ZN7ac87TBysgn1HqIfUvLLL/ZvzWxm5HnuqU0grvfdeSA9VIWdJc
         spFAixjCmYQHI+lZq1tMR6xe0S7MN70TbhHLZlOezh2zpwwY/b3CmZt8I5GsdGvFHBoh
         e9jw==
X-Forwarded-Encrypted: i=1; AKwUvBzTZQjJQTc64x4MCqcTLm6AN+dESVihr+TMlf6qq++FeDoY0eNKWvP53dJ6vQGkoJQyN/PRpl2qiGHjLiM=@vger.kernel.org
X-Gm-Message-State: AFuF++kP5gax39MLMbS+A7JbW+NWd8wHxVrytZNX6VVvqEtL/FGJxLpe
	61C62wCyIV4U2pjm79bxU2UzidlFLZE6Lxn3DiH6KYksK9OTH0k0YPiLLAIHuzwEQcTiKC21ls9
	pNB58CUPbkpzeEeHezq34D5e9qkqIiSI=
X-Gm-Gg: AYBFou160iHVEwcxc+fj47+2f0T8VvWNQv+Dep+DsU0MH91NdFX5LM68nfI4pRXsY7w
	5/SAPGJ1u3aDdeaT9DQuTFVtftiWYT+4VKhA+MFgwwsbqudhaPjpoXiJomm9i7BIy8rkqJD9hE6
	+xoa+FBeyeJC52CD3JoVCEoHFJXujECPKqpYLL7G4dLlaAttwfkvR+IdVwnnAYcmsqf/Z3/nhOa
	j9M5rwC0z+cu01sGPFZLXg4DVZtkk4ujadvv0l1sWijsWYAlJ+WQRtKGX8NoCewxIx5ZR8Mwvzs
	lHhwoJF6ol9RP3+uNn39RmwJrRCjyqM+YPoBfE6CjdLFPitjLz/jx7y7QpcYa8E13waDfqi8mhW
	3FhCE/LcKDYyEvHk46vvnAnQsuBJjHxnd85MOWjYKK6I6kY/jOM8mPVPk6GKGyRlGJdDZB9/4m+
	zoI6Si/ZqDBfacPQWSYXq4QPfnjK8iGRRK2LPoQvDKqy8KGGqInTg=
X-Received: by 2002:a05:693c:8858:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34f06674f4fmr3627740eec.0.1790932619419; Fri, 02 Oct 2026
 02:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928183925.1315274-1-chenhan0017.work@gmail.com> <20261001042951.109054-1-chenhan0017.work@gmail.com>
In-Reply-To: <20261001042951.109054-1-chenhan0017.work@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 11:16:46 +0200
X-Gm-Features: AclHuK_Fpx0TmHbKgavcm9KQTeXzFEOzyVj7LRGa0JaxyZMXfVABnmWgeFa1L5s
Message-ID: <CANiq72mjLh2PgCy6m_gvuU8_na2jfVQ5QLFK8u0-B5sEPxu5cg@mail.gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
To: chenhan <chenhan0017.work@gmail.com>
Cc: a.hindborg@kernel.org, tomo@flapping.org, georgeandrout13@gmail.com, 
	rust-for-linux@vger.kernel.org, boqun@kernel.org, fujita.tomonori@gmail.com, 
	frederic@kernel.org, lyude@redhat.com, tglx@kernel.org, 
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org, 
	ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:29=E2=80=AFAM chenhan <chenhan0017.work@gmail.com>=
 wrote:
>
> Yes. chenhan is the identity I consistently use, and
> chenhan0017.work@gmail.com is my email address.

I asked because I didn't see it in the kernel log, i.e. it seems to be
the first commit with it.

In other words, at least in my case I don't know that identity.
Maintainers picking the patch usually need to know (in this case, the
timekeeping ones -- it is up to them).

I hope that clarifies!

Cheers,
Miguel
