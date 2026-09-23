Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF837FF6D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162298; cv=pass; b=RswAlKqbX7ZnuNGybnWZjCiTUrBMcp7ztvPc5GGr0ppxs0cdun49MayD8nMpY7TRxGV+QbIFPIE/H8aumS4lfsPO6tXU23BgtwCP7OShjArjzWHX9NtXvh2rco/9kap+o0kIaSOrk/RNz9NHrRm2SDoq8wPUsS5b6Q61BecT9PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162298; c=relaxed/simple;
	bh=qk2sZpx9RYrwI6NuwK4VrGrXEs+u3rRuQTeWDZutfsc=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zhs7GAWEXA6/+brMuXJTG/LXurkaqTOfs6sxratchd+eQ0mMk4QDlQ5aabGFQvrqkPXu9LOMltT2vvIGpsSfpgKrRPRCch077PAmmAt7hlNCDbw+24qh/FxRoyfJmxSnJPB18VpB5OlQfzUtikSJUwhchP+d5YAEFYIkuu3oDqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uvF9J53O; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uvF9J53O"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53113d72966so195281cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162295; cv=none;
        d=google.com; s=arc-20260327;
        b=buPK0kN65grEP50vWUL28M7WKxZ1+iZxlLsQZEUb+Wq3kin3F67FjiMjkupBs1aMio
         Ylixl6tJkbViknkAlyoBtx8C4BcPVkr7Ym2x8yCezlteVLPsj8HLjiiVnCQ4zCWIS+cK
         N4va1GCByydsUwg8gh0WRanPBa24uGLVMeU5EsnUKBtmT/qBpbF/rAPwbILBtlemXcFh
         w2NBWjJu7sGuybDMwjqVkCdslHNhSscIN1L/9yoqLhezdrV+ebBwjtgcF8FI3tXqJ9Hg
         9uDA6hQn1IMj8TeYW/Ye8AELhAWn8Y811TOaGmddtRibVJdhhwMOJMqE3xKHmxca1UDy
         MmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=qk2sZpx9RYrwI6NuwK4VrGrXEs+u3rRuQTeWDZutfsc=;
        fh=G6NyrYGiqX0xNKICFo+n/hiLzVAs79rjcgOHuONWVhc=;
        b=fdMk9hLKFoiDawznY+q79zu5sVXeEFs3QItr9wudPzjtAl4g8J3IUfyyCMffpJuuy9
         FZLkEu/0JIgbYBYbRQDlB+DDwubdmh3NVDJQCU6XGANxJJ9MevltW52IyOFS56DK/g90
         SKvOqFpbPUmAwAghZTI90kM8vU+AFrDHN+cpF5V8fVRJfBJ2lQfYALYDiBtegMdvS/lL
         KcBB8f1jmVN4JjpU4opb8ICds2QN53T4MSPgZ3l4wrz+TwuTYpsEp3PkiaJbhh73O0JO
         HKPqwKWRFhr+j6gbotk852JtEXazq7kt40thj6zLsRceGX1VEgFG1aNljevbiXOVWJle
         8FKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790162295; x=1790767095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk2sZpx9RYrwI6NuwK4VrGrXEs+u3rRuQTeWDZutfsc=;
        b=uvF9J53O6Uvy1FfxWq+92G0MgazCa+d0wdXeG/UtyycDKUeL7hW52bPAddMJ+TDfr/
         vK0halXhUOZ/d1annicCVyj3te3ECetY8M7NjuNF8KiLfnroipl85OsLSeO0xMEd3CIt
         c1bJFRHDpZNXbZTrjlvK4ZEQX35PzCDV5OJcSFdW8TzeQeXmsKBwnJ61QzVX/blueRLb
         Bx9jl8n0GvL9H9nDdbzcryO7YF1YMNY+XdOoy2/h4vVy1vyApuueb068++sJdOhqO6kQ
         ajjN0ki25Zd0qKpH4OCA/+qF5ibfTTWMe2s+J9PwlYbduwMTZz9e6/+LkoO+v5TVPtRk
         hhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162295; x=1790767095;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qk2sZpx9RYrwI6NuwK4VrGrXEs+u3rRuQTeWDZutfsc=;
        b=yIlolW51RW0Qqryn3dXdFe4iREhEYJj0H7jnIhl/K/3VKyIDFGqW7u9wLAI06HLeY2
         0mZolM2kbMNhUaj4xVCGT1lrz7uqJBI6D/KG9At2BWg5U/UEyYQ3NmMOfn9hScxQZNOg
         OAa8DBf9b5vBdU17+PI4l9GDKUydIqKQUmaHix5YuLhJSRvvnaSdt0RrQ0pjShWDCmQh
         Ntjt+CIwYfK9Od6ncoa4pB4svFrK8Hqou5ioaTxLW0l5kAcelADgnj4JINYLQj1gJlph
         hS2+1USJxxjF/KxPUNafUniz0SK/7sUsARu2KtXeiSzgKp5VeQZ6StZVF6caVs+B3EaA
         hNkw==
X-Forwarded-Encrypted: i=1; AKwUvBwFIrTRTVF/KG0BzsqOlLSLN46UclOvQMCYwcTbtwp2OA5vSER3X+QINAUjnIAq5dycO5VbwxqrdvydnuY=@vger.kernel.org
X-Gm-Message-State: AFuF++k8RDNjuBhBugGMr0uz+7uBjPmfc+BPiDo63J6M0fQ253JI2Q/e
	/QQy0Bb0MDrPWYbxW9o5YMq5C4DFDV1wZSHftpClEq5PqL+rtKOJ0moe3KyY2Urz6ldLx+oFoUV
	/1WmzoWcRm+sA/jnfo1TtSDLk23DuKToEIe0ERLqC
X-Gm-Gg: AYBFou2ituNKqbpt7YtV2cGSEgB3PKeaS4qt8hmx7nibSHkOHWqcsgRKAEQK+ruDTZN
	0Q6NVQigsOcg6uwqAW4FJGU4ENN0EwiAkY1o4nlEzBCj0JwBWsLs+goVjgSzzCbPFeLz9xTGCT3
	H2LbAf1gXhlmlJCwFyATmSAu/6EI7+7XajTBxUkGt8RtzuFEgcwbn6w250LOc1j8p3Ns477yV/E
	4wrMkC8TSDUQhRguc+r3l6DA5OyZiq6I6ZXPTfiR/RVxnb0FDRNq6uJ+d7gt6eU99VIaxtidR9h
	G0kjs+6EkpukFdsk1cCdPJY8vO6qGsQIFUyWEDN8812UGuCBGYPygi4VyHy3AuHlK/JQh1GqiYq
	Nc2AvZIQ9FlqzJgBkUw==
X-Received: by 2002:ac8:7f43:0:b0:532:ad75:e432 with SMTP id
 d75a77b69052e-532ebc71886mr13957151cf.8.1790162294906; Wed, 23 Sep 2026
 04:18:14 -0700 (PDT)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 06:18:13 -0500
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 06:17:37 -0500
In-Reply-To: <f116f82d28f7af4cfca76adf5cff6093fdf393a2.camel@mediatek.com>
References: <CAE14pdek6ynze+muDZrK+yNX-3ioe3vprxOA4W22qokg352tJQ@mail.gmail.com>
	 <20260918143809.3034592-1-stanleyjhu@google.com>	 <20260918143809.3034592-3-stanleyjhu@google.com>
	 <1ddc5181-f547-465c-bfbe-dbf14a91493e@acm.org>	 <20260920135014.3528082-1-stanleyjhu@google.com>
	 <e3538f10-fb9e-48ce-b48f-bca25c8f3d6c@acm.org>	 <bab059b9a2dfed258db23993b5a6b4aceca2da49.camel@mediatek.com>
	 <df31eb82-7211-415a-9ec1-53ecbc3e39b0@acm.org> <f116f82d28f7af4cfca76adf5cff6093fdf393a2.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stanley Jhu <stanleyjhu@google.com>
Date: Wed, 23 Sep 2026 06:18:13 -0500
X-Gm-Features: AclHuK-6ho36_C1Sg9BCmEpNNLnNvOF2XVJp_zWaIWQyCkMLe1H3gFqG08qznC0
Message-ID: <CAE14pdfbxX7BWzKg9z7ytB9rZPAp40ipXk8NPOdAp2Jv7eq6Xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] scsi: ufs: core: Decouple CQ sweep from request
 iterator in MCQ
To: Peter Wang <peter.wang@mediatek.com>, Bart Van Assche <bvanassche@acm.org>
Cc: linux-scsi@vger.kernel.org, "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bean Huo <beanhuo@micron.com>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2026-09-23 at 14:09 +0800, Peter Wang wrote:
> SCSI reset
> (ufshcd_eh_host_reset_handler) does indeed abort all commands
> by trigger ufshcd_err_handler and call ufshcd_abort_all.
> This shouldn't violate the SCSI API contract. But whether the
> subsequent re-queue (DID_REQUEUE) violates, I haven't seen any
> prohibition?

One detail in ufshcd_err_handler(): ufshcd_eh_host_reset_handler()
sets hba->force_reset, which jumps directly to do_reset and skips
ufshcd_abort_all() (which only aborts commands when no reset is
needed).

On the reset paths, the DID_REQUEUE after ufshcd_hba_stop() does
not describe what happened to those commands. In SDB it is just
the untouched OCS_INVALID_COMMAND_STATUS placeholder from
ufshcd_prepare_req_desc_hdr() that MCQ later mirrored.

Would DID_RESET be a better fit after a controller reset (including
ufshcd_eh_timed_out() right after ufshcd_link_recovery()), similar
to mpi3mr_flush_scmd() and mpt3sas's _scsih_flush_running_cmds()?
It reports what the driver actually knows at that point without
pulling the command into the SCSI error handler.

Thanks,
Stanley
