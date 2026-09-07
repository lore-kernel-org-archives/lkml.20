Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A992DCBF8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756211; cv=none; b=PeneQVCfZpSZPYrQmEsDh1tz/VO6agchipXfbdfFzjy3eub7VHMjh4fMNdnOuYp/IVUu81dS+a05jgi1evVZLPrpQkeMY3gbkmkuo0xlkbEH9wbxmgjP3VoWoP8uu6xGVgsyyTnsymykvGJHYP7PR2nQwZ+ABc9RoKm4Nkfymcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756211; c=relaxed/simple;
	bh=BVw8IY5EYtMD4L+jHzae+iwF/GRDppMCagadCeLC0BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaCtqdrVzz1pkECXkhcfY3Sg4VY4HpNFqcV0TLpbKlqXIw3Yo6k8+0rl3CqGjAIImjqOXleAFKA1zpOc9dFR+eLoPuJOI8VCw7mZ1J96nUoS17R1Ih25T3z63LacvFLGN7A2UV4uLejqMnf/WYtvTkrDH2AsgeTbqqa16PKc1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCv/cmfc; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCv/cmfc"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso2633157e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756208; x=1789361008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BVw8IY5EYtMD4L+jHzae+iwF/GRDppMCagadCeLC0BA=;
        b=lCv/cmfcI0lPNIL6Eee05C5xpctiUMVjry33f0ubuwnZftLXWk+H6LGLqeX6A4TmTe
         gRmTAfIMtb83uOVuXJbJ+ltCNFXAioKeUU7a2FVKSIS1V9j94Xl++L7J2oFmzrqtfXOo
         Vt2JfMup8jWVPacc5rBa3c7pUilZHOPzdw6A5wkgGISIbX/Y9qywJL6O2gJg/DWj1b9L
         CYWSOxAPLSTRUwmfzfBzTV7FE/Jbnh9HjG6dM7cIFWLI5P9wJLeWL4jCofkvhMHKkFnQ
         +6H6T5zxBVhzdguuc6pzLt/wo6nhLQMKr2Lb7GMl/gHgTWLveBigLyM9AObLNV2ClPg4
         fMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756208; x=1789361008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BVw8IY5EYtMD4L+jHzae+iwF/GRDppMCagadCeLC0BA=;
        b=NyqhZiQvGHbBN4dlf7trwCJCsoKUta0TNTWk4ABjn24VKG9dfkxeHOCvz2IB9i6XRo
         AtZd0knwVZHsrNqjjYQV7GfKrIiHFbBl8Oaf8inCVd2J21khX61jnz9BO6WFbTPlw7zJ
         XiPtEIxj2nZmi3Gl/DBkLIGbGoMEZjJTfMtc0fiypJuB/TdNeTojI2FWBwjfNa8CZWRp
         xN9odLIHgDTwiFFMj4oQXtrHHcIvfWt7yHC4i7tggipU5ytn7NQ1sagMwezAerKQBx/J
         QVzEZyFaWbW0OoYps2eRQMmxQxZ7AKeM1tdKbFQdA/SgNaXczberjr42rytm9HTnfD4U
         GeQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkzu4zQKGuP0sk9IDlkfZOz2gY3aducS7YtHparFGUTdBY+mNfeRsIGu7jHNQZ2VU1758CAYEVRVAPl00=@vger.kernel.org
X-Gm-Message-State: AFuF++lBJJ7oAoyS7/wZFs4/O7MUx3K1I5qXtkkZcSRwbGKj8+rjcFJi
	b2AaBugHgEzDc5WTVj3krfBZkCfv3/NcXCrVfZ5usqVxeA/R09c706l/
X-Gm-Gg: AYBFou0j0WXMkUyUIxnMubn6JrAhiMTkouosdQkj4fgjWPxSkIi+uG10HYYGPumfRAQ
	G0TT5yfpxv1OJJaDlcobubhf11jJqwJVgy4/KZSYkagogt4HpLewoQz0w0ZwACanKgDcZNG/Tx4
	DKn0U6Lf07Pyz17AKB45GGuJyx/SKopHq1h6AO0O1r3Vz/HuR3gcxnCdP2041+h8M64vzXh9t10
	W6HcxWUtqhz3C6nQmNIx0QrsSHVnF9pgWOM55rFPqdZVKvMEHJ8S0HlR2z6xNYw0itdiix0e459
	Wdb1gyPgBJjbJH6eg5iC04BbxI/L+hvpQDIvcieD5E2ALA5lg/w66tXZkWvOT7upubk7YEz3Uz0
	d36Gvd294IUSoD3YX10EhbzIDFoHdOBl9n2ci+c1D9fful1/WiD/VF8YrreSpl3eRZVYUZo1Hj1
	ysdZmGAYiRMn5LM4tl9ujgqKT+URBIY9diZK7+PLN3TYaqhm3r2i9VDVA7HUrO6JYcGNU4SiLvr
	xTXnQ==
X-Received: by 2002:a05:6512:3d0b:b0:5b0:1b0a:2370 with SMTP id 2adb3069b0e04-5b616edeb86mr2969246e87.2.1788756207681;
        Sun, 06 Sep 2026 21:43:27 -0700 (PDT)
Received: from localhost.localdomain ([80.66.92.203])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74cdb1067sm1429611e87.72.2026.09.06.21.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:43:27 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: rtw89: fix typos in comments, debug messages and struct field
Date: Mon,  7 Sep 2026 07:43:11 +0300
Message-ID: <20260907044315.4364-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8906397e40454e45b82c12ea272b3a9f@realtek.com>
References: <20260904222548.19732-1-skokovmaksimevg@gmail.com> <8094bfc474e34b2f826b9487e49bd601@realtek.com> <20260907040138.4321-1-skokovmaksimevg@gmail.com> <8906397e40454e45b82c12ea272b3a9f@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping-Ke Shih <pkshih@realtek.com> wrote:
> I think "LLM" should point out the model explicitly, such as
> Claude:claude-opus-5, Codex:gpt-5.6-terra, ...

Agreed, that is what commits in the tree already do. Please use:

Assisted-by: Claude:claude-opus-5 codespell
