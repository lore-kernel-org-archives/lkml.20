Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0944A68A4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060759; cv=none; b=VVZ8ndm707hDe4IMU/KAHdQKN8wP6mN40uSSMuXocETFTAjMfP1AyeT2WHdvqmtqzF/b+iUBnTrXnWMwgQ0UYX7jFZbjGSFOFWKVo+Cs94yo9wIw5xvCppmlVbIWNw1IL/s/hSjmhoybun/zybiH12a1uHtSRvww03NSMkYv8HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060759; c=relaxed/simple;
	bh=MergLDdCfBKxnc+mCNpH+DM/xzoThR/H40Itnzs7rd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDdwZ8hs8Ffq9ADS7UUAx5j/8Qu9sw9Ff18bKSatTxxWy3OKKAhQohqfpHhlLmbqJEqJpK67nhZbldhV6+MPAT/ey0EzvWt6wtqhrxIcH5F6amINli44fUTSXN5JaqmTGzo5fpwRmfcOu+LisAURt5r7LUN/mzGKibVo63RbJwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeruWn/D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeruWn/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADD21F000C6;
	Thu, 15 Oct 2026 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060758;
	bh=rIEyPcUPBuBanOKDxUzKXi7xeGGLhqNR/gzD43NJd+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aeruWn/DVwrQJ5NwLI02psQ/IonbWXUbthzIA8j7E9pwk83DA4Z5Swqb3EsU4MAoS
	 rNWQJjYwmF1OR1fwMgpGvFKpCaosPgJjiJh9Od+FLmZ0MfQygE0OEY11xJlMxwArkz
	 9lPybg2omLdPiy1i4xXTBon6FkodesCvc1s0D4Pbht9tDuHehs1ad8kXeh+7DDi8qD
	 IDuiQs7yFLbSD7eH3wqD9yeoPdObd4Dw2/Jld7MMRI4/tmjOFDAprfBAgLeSDOBbgb
	 dxtNcgFbZVeJ48UbtyxNDMPXpqKodBO7iq8M8wDeNXx1eG3Bqprm7KVtf4nkoUqRfw
	 XKGWsJmCu5F1g==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id C0A6C198004A;
	Thu, 15 Oct 2026 06:39:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 15 Oct 2026 06:39:15 -0400
X-ME-Sender: <xms:UK3QapMAFIAX-xwHe_5amKMSQeiEMBXBTT8hA4b1osKtyD-kHa4ROQ>
    <xme:UK3QajtEEjLScFV9IQy4g2OwxFVuMcj8GLTsuZR6yO80lZLejSUW_H6YoUbwS8iFN
    w9vfuW0YpE7EZx8STNlrbzJ8siN_09xiil5kfkFEXMm2706RXZPd43W>
X-ME-Received: <xmr:UK3Qam016q4d7jdS2_JDZosx5_MWHu_-XcFvTM-qUqDoJoS86k5FnInt8Pc>
X-ME-Proxy-Cause: dmFkZTEp/JZud+h5LdiJ3FtgEy95oDf3dR4JMSWPWklS6HxpGOO301TJEjWQm45TdyBttb
    BI+gPSjib+n2P3kpaP8lWn0oXpbG84FiSE19segvQVvKOHE8DjxN2rBoVKn/FPuAi8UqPz
    ekGvU2jVB/TG+VRsIMOewGL/inTIxfKujn/fJHBDwOM7GXguGRrqeG46FflP+wNKVI+cLS
    wOybc2hnvZMfdhxqcxoj/4mlXduK5ZmsMTRdbfsX939+1TdJPVYg7Ftwj23Nik8AFJ/2gc
    xrJalTmgvPkz8v6L2LObzV1oZg5fSUKANLDTqNa0XrWR6p38r66cSgkij+UkuN9Ep0mSqf
    OpYemIoXQCGe3tlLXgLmiPqtFULoEHq6/ThkmkFJlqgiuYEQkSiu81XMkSQeE0h/nQN9L0
    FHa2PEBU1bBHrjvIQxKzfSXdZPAq6higX7lTRvFbmHNdbmnq4QJ69EJHtC+hYOynuuz61n
    ZOry1NypsHHd/XYnKFztcVAac1/RnDPDTo2LccYsGeDLS6/miPf6McoqwXfpfO4mRPX2f9
    uOwqLiTEPrIRTk2sSCuyaikFvNcIUTEmb9V4SyQJeqX+uNJV66rFJf/3Mwwz8tzNQpGVoW
    4sXEwXL6iu8f041G5VeDf5oLob6J7OXE6wL5fXgpEPcv/gTqBPYz8Bv3RZ7g
X-ME-Proxy: <xmx:UK3QagCvx6Wy9AS-Pn7qv_AeBrA0xD0rznpVsqPoFZDSpeCHUW42Eg>
    <xmx:UK3QalUuAN1twASC2a4RDhCJP6pFpNCEkzspO-4sbsnw_UH4AywU6w>
    <xmx:UK3QamUhg_CuDFCe6WhZ7QmAi1lD-y6D6tqYGV0kz70ZhP6ZuwTAtg>
    <xmx:UK3QaqQlt8QVXIEOnym6gcte2bx2GjNHZkJ4W0u13Afy2mejWa5jQQ>
    <xmx:UK3QagP1mn5SBVj-anpSdc6QxanxTrYvxjQOb7xDQeBnC7iopkqEQzO2>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Oct 2026 06:39:11 -0400 (EDT)
Date: Thu, 15 Oct 2026 11:39:10 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, dsterba@suse.com, 
	hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com, 
	tglx@kernel.org, x86@kernel.org, torvalds@linux-foundation.org, 
	hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
Message-ID: <atCpTMcAALymqADw@thinkstation>
References: <20261013100442.2658311-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013100442.2658311-1-usama.arif@linux.dev>

On Tue, Oct 13, 2026 at 03:04:42AM -0700, Usama Arif wrote:
>  SYM_TYPED_FUNC_START(__memcpy)
> -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> +	ALTERNATIVE_2 "jmp memcpy_orig", \
> +		      "cmpq $512, %rdx; jb memcpy_orig", X86_FEATURE_ERMS, \
> +		      "", X86_FEATURE_FSRM

This grows the patch site from 2 bytes to 13. On FSRM the replacement is
empty, and 13 bytes is more than ASM_NOP_MAX, so add_nop() puts an
unconditional jump here, executed on every memcpy() call on FSRM
machines. :/

Maybe it is worth moving the patch site into memcpy_orig()? It already
has a 32-byte check. Which brings me to the other question:

Why 512? memmove() uses REP MOVSB from 32 bytes on ERMS. Can we do the
same here? Then we don't need a new branch at all.

--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -50,6 +50,8 @@
 	cmpq $0x20, %rdx
 	jb .Lhandle_tail
 
+	ALTERNATIVE "", __stringify(movq %rdx, %rcx; rep movsb; RET), X86_FEATURE_ERMS
+
 	/*
 	 * We check whether memory false dependence could occur,
 	 * then jump to corresponding copy mode.
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
