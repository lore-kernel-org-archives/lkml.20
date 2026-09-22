Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F7B51C343
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074612; cv=none; b=G6pxFdVwMaDBa0cB/xDw2NBWZ2AtDW6tfDmKNdIEPus2bTcY1fWHb08rJt65q5Z57C9xGMbNbaJybwMXzmOqIxYPD7vEQu6LAnbUgdlXYqVqnqyEnteg6zBMFPIZh0sQUd+14dNyP3X7/C5gX1219MXeqQTh2EJW4A20++qHHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074612; c=relaxed/simple;
	bh=dPFDKwpLdYY6Xz8/aXlHfyZiX/t8VPMj0bgY4zGFzSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CR4X5FVELncHHl272s0ecEhsxIk9O3KJhdNcvsnujSUrzBJQe8i9wHa7adbc5ISVio98kXOLBYRyzoFo2ucv4tIxT7YNf3yBE/6n5n+o5LKVNsLIG/+vBVfZGzg9ARZIStpifPU2V+jPEDGe2VOdeOduw0mYqbZ4GdEOguatpHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc5zusmJ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc5zusmJ"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b355ffso2395018b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074604; x=1790679404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPFDKwpLdYY6Xz8/aXlHfyZiX/t8VPMj0bgY4zGFzSQ=;
        b=Xc5zusmJ1eWaGLIjBC2u9R9gwo0INyOkC3WgJhsX25ETi0brFfnUbVvClI5XbqTJ1X
         sZ8RtTrcdiENGehZOawo6b3Do8CPG7cJUTEsrlyNYEpurdXXVjg/6nSi/SVc2rpj+2uo
         rKmVp1JaYLzmCg021O7GkcoOFHKjKsWgNRm2LEW0uVdgQWWv49Ov3R/Y3vIO+yGZE+to
         Si3c+OMlWJ99apZqQFOq/JZP1Uoa5ffJUj7uPUSCWImiAgiZvQdUrF/mz/DEcslod/cY
         QeEYS8JQNBs21uY9NRqS46YyZf+YAQSTCxZH4BIClIgcOHMtOplIW1T2OmY+iFVvO10v
         aSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074604; x=1790679404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dPFDKwpLdYY6Xz8/aXlHfyZiX/t8VPMj0bgY4zGFzSQ=;
        b=S7NLi3EuEh4nIXHQKEbjXHdNnryX6SbA5Hf4z/VlPgogBCTP4WriAkQ/8UNE1nryN+
         kMl0V/K7lMrph62O8+LSlhU8E95LRTXBFDNPU27MDc8rxIVcfHd093EugaSnZJPYQNsy
         0Be/r5t48RHqnKGbJId6IFMrapPCigp1qTmiLlwZa3x5F39nR6vqsQNlf1o+AJlNLf/A
         i86bZWhGXwteBmkF8HDRXm7eYHIs1HustqFUNwD3uaMqdApz7ypFwW97+LKoLfJYJ/JS
         d89/m4bfoEMpbd3/E6Cru+x+vDpHzh+wx2U3901pWtrR875mnQCj2nffM1s5nAbUizEq
         0McQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz7GGAB825dIG95dKTMlC1Y3j/XfWBMzXWynyD/CsXxU+PYeCwLFD0NbrlmJkZEzb/aDGucARFIK+vU7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k3Niv3dcj5sXj78vCWHsNogezuNhuLA0Sz83tM0vG5bfG1+VQT
	QK4oeuI6zPFVK8yqHxEp1tf4yFY0gRuQ0QSltdIFDHaTyOBb5FvOfA+7
X-Gm-Gg: AYBFou1a1NZi/Y8zWXnjSHCyEQpI7kkJC/s1zeHGpsj02OEFWb1vs1gVW8vL+PGtqZh
	fapZ8AFwN9/MajSXVFY5Ll1gYxpk2eZ6qsAXYxN8t4d0EdfSdb/cuzCOkRdYX6B+6lDkGI8Eop7
	NfOFHPml1NF0YAf7NPiHqtNoWMWyq8ux5rUX7V8ZuUBqkKZKMXNPa1bDyRXVFO4Em9jld2CWTHT
	iN2kHoW0o0N51/gfZ9V/cjmhu421QggnhH/+0cQiLm89m0CE78vXev23vAygfxA6TqRtaA1AITW
	9WE5/0m7pXUlf2I0DCorbwpyHI/qez//GiAFXiEoCgVJn6egsmSK/GQY9Pp7+kT0C/30O3VDTlS
	hXPdNL5q0GSm4AJlbQ/l6Y5mElai0eAxm+GK7AWH/m0ibDTinqo5vm3HSR//VHg3ahAu/gX8ZEE
	v2ugWK2hcrSb0T6WMXmHX52r1+O/0xeXA+cEEpeLd66e/5knkuPY6JsnGn6C3+ZHr4mAZn9YVDp
	jic/lET7IOZBfyedm+InGopBJM=
X-Received: by 2002:a05:6a00:3001:b0:872:cadc:bdf2 with SMTP id d2e1a72fcca58-87c81ec0039mr736727b3a.14.1790074603769;
        Tue, 22 Sep 2026 03:56:43 -0700 (PDT)
Received: from urmom ([1.54.70.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c2fc4baf1sm653791b3a.6.2026.09.22.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:56:42 -0700 (PDT)
From: Lucas Sproule <lucas.sproule.42@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix error check after devm_ioremap_wc() switch
Date: Tue, 22 Sep 2026 17:56:36 +0700
Message-ID: <20260922105637.1684691-1-lucas.sproule.42@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831-wcnss-is-err-fix-v2-1-5520fd4c6b50@gmail.com>
References: <20260831-wcnss-is-err-fix-v2-1-5520fd4c6b50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

Gentle ping on this one. It's a small regression fix and already has
Konrad's R-b. Happy to resend if that's easier.

Thanks,
Lucas
