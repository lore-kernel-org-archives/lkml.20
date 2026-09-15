Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1313812FB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455715; cv=none; b=iO9Ce56isFfbPiHpC1biKIt+csKPBVFoTjuzD3AYSDHxffd7CwrE5py2x72iInaPn5kVvsaG6AJdk00U8XlXMRgclTV8m5JLsWGZhChV6dXIn7l2DKKx5HMDrrI+BzLifS4Zcy+YAxDZ3M7eSTacKvqPaq26n5B4C9LeTxo9wd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455715; c=relaxed/simple;
	bh=ABFOqz8UGc+zjPjHLhOhSBB0474o5YlUncpSARnh6QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PizEBZXKnafDTWHfhvjw8LB4OosxUhl0a78fLbluPsVQJTqM6hfUAPw1xwL8UOjlcr4osHeGqZ1D5H17SqQOt45b7LeTb8S6OmhPPSL/E2EaaMwlYDsWF+XulNQRf6IK42H32fyIxbELo4pbIuLmjRMXRxMZs6j31vjKUvN3jbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgS8MavY; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgS8MavY"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7ffa69b7462so4513613a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455713; x=1790060513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlLsnBAMZpYcEf/Y8Ex2NqI4my9dQsnrWeEoJz1UkLY=;
        b=DgS8MavYOCGpjcsAerz1+W/4tzvFIwiyVV5gkzgWk4Ceq4AXkf6tbYy1e/IHQi+J8j
         /oi7t8gNoJAZlRNbC3etqI7Shty6fEkozr9Bjk4+EQstJH+u+Q8mYeSt8SL2OPv/ZfkK
         3pTMaez1tjDpYtw+E1aOJ7c7VIuz3X0ARcPVEgNZ/7E4yogRAa2/Z7U0GId9WOi7ElWk
         g4KT0lRUqh/XhtfeTGwlH3TlaxqZw0jdofhR0UjUlfTjWm6xqJFHuUQn5aU8HPz5LuJX
         hrDPbPgsYJXLXR4+X5rQI8ssUcm3tWcqIlwNAUCYliI1q4chb/XSRaebk92/aWIXYftP
         13ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455713; x=1790060513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QlLsnBAMZpYcEf/Y8Ex2NqI4my9dQsnrWeEoJz1UkLY=;
        b=qP4WFEfyMEZHR9LQWNdDqQ8Px0gyU4Nxlbu8Gx4omrRSWkQtTak2Dd5Sanq8rtqdot
         3KTPZkG5dPTxqTkfSHgRERwq44PTB48YZFb/3bHj8QoUK7LnKlqpUq+hG6TANTPdI4Ua
         9Z1q0HHIZnAL0VPcOrWLfREjv1wXmu+XokwAob3mEkyMozxmI73OK4shti//4xSEsirH
         M0QsLGepXx3B6fSEqJ9cBv6rDzwF4Jz5DMevrIjQV7fhyzaNA1IgcH3oDe/FspRwnTW8
         hCKGjmehflfDI4K0QoTFMDi+5GFTjBEsEMzJreVreeNB1s2+S15UAkcWkBtt/QwfxJqK
         OIFg==
X-Forwarded-Encrypted: i=1; AKwUvBzq1Kt6dDDtbLwqb3WyRH/ZqIhDyPvF6f2IkYb76pPfMSMYnFVdYHGPJcpVgTYNbYrIwLodHNerZyUaUBU=@vger.kernel.org
X-Gm-Message-State: AFuF++lDQ62PoxHaMReVYd9LBXzsTra0K9ermAwxfh7l/y6H6lumZ/Dw
	lDzDDf0MKETpkhHm1PLlBtUkRTVB9XOTLYxGYGbXr1PCh1IjmwZSHWLg
X-Gm-Gg: AYBFou3w/PzN49b7XCgZmdqNzEAWp2cz5RN3QfDem45Q7pCyoD6uJlK5cs8wjjjtcQq
	yR25jHhyJ8fbdumhaT5+RYBSgb1nEyRQ725RWiLWDf3JUSv8hPATet3jywYzp6E2XI78WhdwUZD
	BrtF9qhuSobwUXbaMy5loGKKRlmHbba8kJlMiEEfUuabXQlDf4pUDsh/lb6n251I7OS23Nzl+FL
	Dx39QaBlSeeG5iMi3/ciu6rlwRP1dhbCbzhbBM71iU/fSkhvVHlUJ93PGNtTXbIcqh1DnziACFZ
	aa6v09Dn0E+IHd4W7r+g/gffrHF5i5PgMBCOBRs0v3RIjdsK8pYTxAiurc9SUOdELPgsRNvgHkz
	lip0R9kyxAqAXtdGh8UYXVYwWh8SqpU89GOipW+lBcpQc01WmQCSI6xsU4G9JN9lIdbBX4UqLM/
	Gby+b9xiFtmDr20OrFs36UvrI5vjMs3IFfgB5v3q98MNx0byHZcIAfMHGulUvYsv3W6tH4QtYIn
	gtr1HFLRgEPbaoDFGZgwsRl
X-Received: by 2002:a05:6820:4de7:b0:6c0:5d5a:e0e5 with SMTP id 006d021491bc7-6c540772e7fmr3296040eaf.29.1789455712197;
        Tue, 15 Sep 2026 00:01:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm56553791c88.12.2026.09.15.00.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:01:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Wei Liu <wei.liu@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Drivers: hv: fix typos in comments
Date: Tue, 15 Sep 2026 12:31:43 +0530
Message-ID: <cover.1789455635.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044946.10813-1-hemanth.selam@gmail.com>
References: <20260907044946.10813-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two one-line comment typo fixes.  The diffs are unchanged from v2.

v3:
 - Trimmed the commit messages down to a single line each (Wei Liu).
 - Dropped the Assisted-by trailer naming the model.
 - Moved the note about the v1 -> v2 subject prefix change out of patch
   1/2's commit message and into this cover letter: the prefix became
   "Drivers: hv: vmbus:" to match the subsystem's history, as Michael
   Kelley pointed out.

Michael Kelley's Reviewed-by is carried over on both patches, as neither
diff changed.

v2: https://lore.kernel.org/all/20260907044946.10813-1-hemanth.selam@gmail.com/


Hemanth Selam (2):
  Drivers: hv: vmbus: fix typo "substract" in comment
  tools/hv: fix typo "retrive" in comment

 drivers/hv/channel.c        | 2 +-
 tools/hv/hv_get_dns_info.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.48.1

