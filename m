Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38E4BF94A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357642; cv=none; b=MbmeLBNt96PXjmUzt8wxxTF9uiZVm32lpZMR5grqVOe0AZj2bX8rWXyWrIPX7UBQxGHRy4N1Kk2JEBggqWye2ovay5xj68vQhWSeL313DyQdqqFJL3iEiLI8dXYPznJ8CagiiojO61oDwQdvBkaonwuk+DJou1+s3I9LyNAZBIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357642; c=relaxed/simple;
	bh=OxVp5blXVvWWmnImx1+XEc0zq9nBmFNaKuqVx4kCuaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1+Skp7faCdCdmw+M6TGSRj5tw0+hwKta38AXDBeMaD82a7TTwN9K6Q30FRF3ymOMKTIRM4jcsU7XBFibvBRESqVlfv9oGn+hcL/0u7mHARWIkAfoRZxYFlD7ZABKAHZwMTf+0urk+QnSntDzBFOnRhsz2gtphE+Ma91G2kcUb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfDhz0cz; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfDhz0cz"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so276139a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357640; x=1790962440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agi18bSwTkeIF6jxl6q5OYZO68PEHIdc/8ycnGopS2Q=;
        b=UfDhz0czRfHfchD+u9xSnq3Oj1cvyktOwGBGR8zf+x2tfPHQaNFirfLEMW0q1aYu4X
         aHAmXY2IxyGig5rVve9ZspH4/FrPxq+iOPtby3JOj0gIzyE7lmbgQMnudMSUAeVeu7aX
         62rFoigS3QWyHBi6If6qcJdTaq6NAKHViPoPW/eCICtFBtp1aH/5VES78c+/QtCImsOe
         /3y46K8KOXyzPYiV9oiJLYoAq3qUoCuKBmlakVpFgUFryYYi6s4zc4pdeHL2rn6puELM
         HPNRPBTK4QidfDiOrTXTZSerI72FFcFBmamaUemPN37QKoSsQAMYrNXUvN2J2G49Hygm
         tQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357640; x=1790962440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agi18bSwTkeIF6jxl6q5OYZO68PEHIdc/8ycnGopS2Q=;
        b=lImOwlWV/nF1jQTkvmRxi3UIcMsaKNIAUHsui6ePtJ6fpIS6joAUQKLL/Wip6Kjjtf
         ZLziXOxxJ+nQkPSxNmSYGU0Gu4yB10S0kJwb/WrylpOOLv5S5Uz4zP1uYE64B3id55Mw
         7r9C3uKPqBhmaaFYESEOW3BvNrZ6GKlX/XG7UYN2EBPVsVonme85oSYnflyeXdM2xN/P
         ufq9qmBUxn6ICKuWy5lmTeN/S1uYD603nc9tXgv7CTFl/9iSC1TwfWAEE5lsUpiqkDJ8
         gESRrbxHWgz6m3lW4Xlb42yC2uNZ+AnvUsWl+ayKhhGx8/cOYcDaBJO0pV6nH+SJV+Zc
         SBcA==
X-Forwarded-Encrypted: i=1; AKwUvBwrbhoTmH19mxVkF9xH8Ll0fg/0upBmPk7f4xSvo3OL4gGc+bEJEVtsVAdKl/PTH0bNTtahpEOGOgqP1tQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lFhfktX9YdKKUKWAwMaooBIfGtOkVm13/CTu6u3UUQdbn5E+kE
	w+0Gm5xx6FawnkFxdBT5MwuVdyweO1tYVoWpxz6x0dbTkTkGY6EvP29H
X-Gm-Gg: AYBFou3brccxVzmqKPic7jDiYTeqn0ZzGF/RNr2NwvUtDXDZs0yWXf9grshbON1CwBp
	zwJM+XLDvXGN0BzMw8r5aH4POP6RWW52SMheI+57so/MNjbmMBs53Z1mmYbe7W/+deS6/+he83e
	Z+QyS0RV94Plflck23J0PDk95OJlHPJq1/CBFy7jgZrItHb4J8baovDy7jp/uVKX1xKGfOO2kFC
	/iKxRbgTyw9cSeS0FC683Lb2qmNmcP/RwjB2P3uRXZmIq9BnqIfUlvDkwioyhDCjam/Lifv7e6/
	gQPKnFASXx/s6rs99iIE23chRStnZb4ATQcuEUKGPBAxGjy3A0blnoCHL9xTYEklp1Shn+EXrHP
	9vugR/zXmOLRamQU4z5wbP4lbUcmXZOqYoG2ZOeerZ3u/VOJQq5Ik3x88Gi8u5ssMzioG8MEsFt
	pcoL7lPnIIxSz4CX45Ztnrr2HfQqi454JgWtSPjRud3mRt5FVWnXTfs1vit9yRZVaIxblPPL9ME
	eZi+Gl/YNfZBEZfxH5yFp7iR1j+QTQH9qZgX0uOr3V7ymHRrMTrS0eO2vxStkNVb/nlsLbk8MiO
	S6P6ihqSjfAv1c2fyXS5SIQsg7bKUKqk3tOaNg==
X-Received: by 2002:a17:90b:184c:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-3a098ad9d5amr5053899a91.6.1790357640121;
        Fri, 25 Sep 2026 10:34:00 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm651224a91.1.2026.09.25.10.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:33:59 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 2/2] ARM: vexpress: fix device_node refcount leak in vexpress_smp_dt_prepare_cpus()
Date: Sat, 26 Sep 2026 03:32:52 +1000
Message-ID: <20260925173252.933705-3-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925173252.933705-1-geoffreyhe2@gmail.com>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vexpress_smp_dt_prepare_cpus() obtains a reference to the SCU device
node via of_find_matching_node() and passes it to of_iomap(), but never
calls of_node_put() on it. of_iomap() does not take ownership of the
node, so the reference is leaked. The function is the .smp_prepare_cpus
hook invoked once from the __init SMP bring-up path, so this is a
one-shot leak of a single refcount during boot, with no functional
impact.

Annotate scu with the __free(device_node) cleanup attribute so the
reference is released when the function returns.

Found while reviewing a CodeQL report for vexpress_flags_set() on the
same SMP bring-up path.

Fixes: d2606f81d563 ("ARM: vexpress: Simplify SMP operations for DT-powered system")
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
    hardware; I have no Versatile Express board.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 arch/arm/mach-versatile/platsmp-vexpress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/platsmp-vexpress.c b/arch/arm/mach-versatile/platsmp-vexpress.c
index 1ee3c45e71c99..b810ad50b98ce 100644
--- a/arch/arm/mach-versatile/platsmp-vexpress.c
+++ b/arch/arm/mach-versatile/platsmp-vexpress.c
@@ -61,8 +61,8 @@ static const struct of_device_id vexpress_smp_dt_scu_match[] __initconst = {
 
 static void __init vexpress_smp_dt_prepare_cpus(unsigned int max_cpus)
 {
-	struct device_node *scu = of_find_matching_node(NULL,
-			vexpress_smp_dt_scu_match);
+	struct device_node *scu __free(device_node) =
+		of_find_matching_node(NULL, vexpress_smp_dt_scu_match);
 
 	if (scu)
 		scu_enable(of_iomap(scu, 0));
-- 
2.43.0

