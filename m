Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986271;
	b=ME/4/3dNorjMzLXiVjQGhszLh4WcYcBUrLEz8Nej9Xg6gLnEOPoUK6Zt8jwUkVE2DkWu
	 GTgBGIJ1V2eR7u52VNnccZqeFPNY8XSQA541m3fVhSPSHfjFEtx7v61F5y/j7Pvxda5dx
	 bKdvkk+ke0gtqNqE5pHLVJ0XqKy45S9oxCAXhHAsfaHfNo5XlhfSuvws5Uj+wy1Q75VPz
	 nXtMS6j8/xJjpG8bwbyveKknKMt2reAG0m1UzBKk2xA2LAWWLJZAwivICI8vz9vpdKQyN
	 6dyLU/+zoG2mjWNFkAsdOenHJwbE9g9CIDRrBDla6KjWgJsQHudkVs6JTEV/DCYWvqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FuZU9Bm4L1tjpR5OE6ZUvzPtHgo0PRLa1bH4/fzLGaA=;
	b=P6zLCCWwHxAFdCdk0/9/UPJKT/rMv5VczHL6U08Frmq+SAYWMlTAH5/W6sH3koKhTNKn
	 RDt+9/eIGrEEOM7ml+Rb1rWAMuYERqCPsm5xRXBV0Nh5yOO0KQb2QHQQL6uQ/OJChzef+
	 AhRKyHnkIi2WSD3Jz1/w1GrkSuWRdtzRCvurbIKkrsbxIapzoS4l/urWZkZ97LQDmocS4
	 EUrEkk4A0tMvqbDU9Bg+TlJ+m4JjhTmnOhuoUd7viOctK3QJ8smvRUo0nLatz1eNHeK0J
	 bA4w9TvuIFKmN7D6UrRbeLkeSwoCp8asf6flkszSMN6CoZiTUX2j15khxPBlRVxoAqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFeqDJ3a;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF22606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AF22606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFeqDJ3a
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53bb57f1310so7981651cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986270; x=1793591070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuZU9Bm4L1tjpR5OE6ZUvzPtHgo0PRLa1bH4/fzLGaA=;
        b=XFeqDJ3aqCLfK8rrrOUKshScqKQbmpP2YKgSEkoMcDpM1IGtiD9AxmIQ4pb97xtnzW
         wF8WVlBAxgPHE13QC9fwkToonYBTQroVIa+N8zTzWLWUbJ1A2o5s8mArhBb2AqPnMlX0
         edRMOh3Wr01dtJsTWl1AClAKCJRFUFd2Pi6xti/P+EstLXMOF45iDByRyEzccHlViIip
         ShHDZX/cm+8UcpgoRtTkDKRgMGmfr/R9uv41GxiiQnRbfB8drvGTaS4dH3IvurK80yPR
         2L68p1pDbKpFdrgJ+qe4UeLMbASOFKO5aw9B6fFKliCmVCKOj69P7JY8ct9ivfFCSAz7
         qaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986270; x=1793591070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuZU9Bm4L1tjpR5OE6ZUvzPtHgo0PRLa1bH4/fzLGaA=;
        b=FInT8zM8/8XZsDxFPQsefmRAw+hcRkIxSIuotFwQVqw3t6t+MYEe+bysmsNoF18L1N
         klCGwJldZtVEZCwFMG/nGRBFKdSb2XapQ2StlOSAd/p6iExfjYZ1H0a02U0ihFjJrOZ6
         aNYEJajIwtXZdzzWCqFfuGY70NQ+5ixpvByx7CVFLU4N4lpeYVzJW/ASgheZjg4C1vcD
         Z/sPcySNA5Ox6p0rJQ+w2hAaw00itrmid62W91b3+BC09dGu25TaQpP0hIAI8crE1sqi
         AIdlOtSIAEn8+KjQaDjF2Aax040snt1S1b+huhJoBN6uTEf9ZyzGzUY9+rpGh+Zxh5HW
         v5qA==
X-Forwarded-Encrypted: i=1; AKwUvBxhJZQACi0aubcqQXO6uv82l62fVj36tNNVE3KbIVeoczeHuurYNozmqJGG6KfTuH2T++O7CzM7eZzXz4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGacFrhX5o6O2JhHKk3YmVNzLvsv0FzxU50OWw4p4f+83XzoFC
	LblFQqKGON09TgEl7igJG1LY2wQU2xkazW0A6BnOI2YQ7aSvj7Ym35vw
X-Gm-Gg: AYBFou085n/K4FV/HDKok9exWN3xA9a5lazfFYy3zs1zdGy23ApeQ5oYE89io8VPphF
	tIgNKF8Yssg1rHn82JJaqxZWiW62aGZJ8DfSGD4727Mji93iKqRsyHTHEjBCnCcENGguLzq3Y7H
	0eVdUNw1EPTPfUW1QcLbtTDPz9KNoSlGqcYUQmKkDkD0MFWPzeAgNdOCCQ7203869iOMfN1k8Ka
	R/3Va2VokDnrxySGEEiVDcm8wFqKFGPTfMfR9LDv49LCXbClje1IadyatIbCFCVasw4zWQSEMfx
	Rhk6fZ9E9EtU9QDvW52B8O+sJbFygF/mwU+GHqoPOIlx7XGdxl0vkQ/GgKlm8fmTwuNnOYGitnA
	+oX7qgHsiV0XFf3GoxQXuulwxjcnpG9qLzsMgBU32MvonEA9U2G/ztDksGH28aNPN6KbUW6xaM7
	EluU0H1sk2QrvdohXYOpUaZ4IcBzD3ADxfAWrZUlyRlYM/weYXsMLCXQPgBlELgFfWXQujtxdtM
	OyU6EBMhpUnuYjHttgqFCsgPhF3caLXVSBU4v/OXFdzZGtgVqZoQTjFAv19E2s95absVTSYSOeq
	JWRAmyOaL2kpHSBf0Oioo1HdjLbWZW22FCwKbU9mkfvnQGpGztVRfjlSeBa0
X-Received: by 2002:ac8:6546:0:b0:536:699d:9a1c with SMTP id d75a77b69052e-5383b3509cdmr79585421cf.2.1792986270529;
        Sun, 25 Oct 2026 20:44:30 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:4cc4:d0be:4ab6:9a0b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm46202121cf.9.2026.10.25.20.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:30 -0700 (PDT)
From: Paul White <paul.white.kernel@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul White <paul.white.kernel@gmail.com>
Subject: [PATCH 0/2] KVM: riscv: Unify and optimize FP register loops
Date: Sun, 25 Oct 2026 23:41:25 -0400
Message-ID: <cover.1792982932.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change to both patches in this series is a 
structural/architectural one. Both functions set_reg and get_reg use 
identical code to locate the register the application specified in the 
token even though they do different things with that location 
information: the set_reg function adds data the application requested 
to send to that identified location  (in the copy_from_user function) 
while the get_reg function retrieves what data is at that identified 
location and sends it to the application (using the copy_to_user 
function). Everything else is the same. That is the only difference 
between the code. 

Therefore I was able to apply the same solution to both of the 
function's finding-the-requested-register parts (which is everything 
up until the final if statement) which were filled with redundancy. 
The solution I came up with is to create local variables for the 
entire function for all the variables of the original code that would 
be different, depending on the floating point type. Then once I ask 
whether it is a double floating point or single floating point mode, I 
assign the aforementioned variables to the values they should have for 
that mode so that when I go through the if statements that ask whether 
the requested register number is a status control register or data 
register, I only have to go through it once because the respective 
floating point values/addresses would have been assigned to the 
aforementioned local variables, so the whole code kind of changes or 
is tailored to the floating point type. 

This architectural change/solution will make the cpu execute the code 
faster (as the cpu will have less decisions to make and the bare-metal 
math used to figure out the address of the register is executed faster 
by the cpu than looking up object properties and array indexes), is 
more maintainable, and is more readable.

Paul White (2):
  KVM: riscv: Eliminate redundancy in get_reg function via pointers
  KVM: riscv: Eliminate redundancy in set_reg function via pointers

 arch/riscv/kvm/vcpu_fp.c | 128 +++++++++++++++++++++++----------------
 1 file changed, 76 insertions(+), 52 deletions(-)

-- 
2.53.0

