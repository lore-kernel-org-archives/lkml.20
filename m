Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679838;
	b=AhNxU9e5oLVquw1mj+v6M+oMthshPxhcFRmOTVUDjDcFT/znopGVoE3jl1ks5+YddqIT
	 H2l4azbCoQK0KfRZcQlVXtOlqWhTe0DXMOFZ7l3qeW2XaodI3MGnrSPvCgRvzq3HSCHX+
	 Ugc1dfizknxU4D7K2QrmjVQvHT+xzpbj0NiEG1isOPx1FyijyD5OhPtjiaqLRDJGAZ3xD
	 FZQvpaOfkcb8FqsuiMJJmvp5+Z9lCLC6XmpWKjkeFmmL9uBnXkL/ROb/cNHP16BZcNgQe
	 TOVfZoWjAU8HfHHA6RLXg6rTEI9KevSywQzjEHOA70fNv8rxrChC3UIzc+i92A0dLGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2tV4PJFJAVwFY0+x5FVmRJ66Mz8ksU1cklE+L0oAwR0=;
	b=VuzdroATIGc/eJwLGbye24HawZ+sGqh5o+/sEIZtwSY9bWtHLWHlk+Bc5WOMvFAAKmK8
	 HTlDXr3tRyI55gkohskNij4P8Gi1xj/hkzoL2FcLrlpYOsrwLg+EaieOzjkfY/EhhqtEY
	 nGtBUxY4eizuQSGOrCZ0Sp3VqgBk2Y5/d2ojYaQ/ZcaYmkM5JiPFT6TUvRInjSP5vEADL
	 tQqzxgewDZTVFMKk4l05b8tRO8heFZDwPodLGcV+fg++Hd5sAz6QbT0sHGjW8YnPbIFqm
	 /gyIVzA306qCdy+UKykn+PARiz8Sr2CK6u0y90OdLLfTslKbgAejMb61h2CRtaCCJZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMzhn7kX;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACB9606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ACB9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMzhn7kX
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso15433805e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679836; x=1795284636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tV4PJFJAVwFY0+x5FVmRJ66Mz8ksU1cklE+L0oAwR0=;
        b=aMzhn7kXKCmOJvqC92S+Wrg+rpJTZroEoirJKWD/NhfoOxNbTEdbofqZ+6e3Yzb5qC
         ynRlOQPicL2vButW8JhVlHJJTk6GjsFaYd0HfUq8WXl/aoFlqVwn8vXfjvZXABoVuBji
         WzFqJVC/uOrj2XyPh7KMVAUAdPFD57Qm4xAy9wpq2Qxnxb5e3FU1iK63CORDFEsQd1P5
         8emquMPLNPCAThKJ8nwHnYNLU213D4SbAes86nHU1RzOzwn58TIiBDLYcs5AX/zfuGGI
         9pnLoI1tJOyoAYJglnrSmhdtvsEt/ZdxwzMpkzzUVPV5OXsD0/9o1seQtK3NsTvq4jMm
         8SQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679836; x=1795284636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tV4PJFJAVwFY0+x5FVmRJ66Mz8ksU1cklE+L0oAwR0=;
        b=LHJDyGnHqIxK9+Vc2ZjQ+XIjy025r+9f4mxyU26artD/IUdAI1hDLfvUuyLY0ICnlA
         yU6NSZtFZJksIa39bGVUXojvPBeRzAFlbkHWCKqJ4YkRBlwb/oQgarQvmD/dG80+jUAn
         MwVHEJu7LXlpgxiT+wkbWnu20tAJtdgDI1XQBsZW3eUQ8EdvaOeNNXp0e4C40TMjmMsF
         ii9YGs43T12XYushYxkRNHW0JivV3eLln/DMUZrxqrK1+rEU9of3sodFLEn2Ar5uf/zS
         d/oL8ldAO4X9dS9Ekx6r/WhBBJy0/TIALu+ILRnbApYXyEw1FYuimdyziwY/S/JiGlsn
         yOjA==
X-Forwarded-Encrypted: i=1; AL+hErHA0UPKTIvZUaAHLtj4Vu/5lbeQSeIA+tJmtniMnNAYT8uNFWMkuaEcvd1rNprag0geNxYVTxIeyqUb3f0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n3cmWr72g8iLTUtzL+9Kt7NEzoLLhVMjcu0ywTNxg/bPEP7tB
	JcMnQyxnyUuRJuQsiKCmZibnQvNTPBfoomzb5n85bMN2lgJkcXiYDSU+
X-Gm-Gg: AYBFou0cFJ2OEiOlCahDQVOjeLfGBt8fcxX4fxL+UCPKu4V7AjzPwCYUkIjORLnJeld
	3J6OIbpZ8ulr3dXZ1ElHWR1CafbTrdbZgFkt7gVdoxeQ49nOq619NZuCm+v8rbJCyLSiEyoJhJ4
	du5hssWNQXp7/XXQlLzu+3qR32Xqrhhr80Usa6u0jR61wCo82rDTobJ8PoI0P5cuRPWWa33IwFs
	ovNBFQcnL5B8BM8O7iKTRsdL24IjT/R+Prh+VmA1QAIQ+4fikuln0h+ZK6dOv4PvW6spgC3g42g
	44zqs6Gy81E/4Ft5Ya3tbwILtGnioFPqFUePj0pEXSpunYGV1tnLOCc99MQiY9H9zh+Ks2wb5x0
	PFTDWgEuXCNNbELVZB8EzBEMSyizgUYrKjUruESQq7B0HvAHLt1iUE0L2vmOOEAb0SuKrCdQ1pA
	yM1wxGLAGGjnsCdkMbZGVSInt/MGistYicMxre19NP2+MXSCx4laNL1svx4Ww4DcK3OGgyGix2J
	KQ5eHqzy72UrGsS+DAn4OvtxfjZ9gvnnbcExAHVT/Au4fi2+CS4BIduVMnq0QDN040QIx32Gy79
	dUmvD4zJ37FhNJfR/xtbRA6UgdcFWbbF/yVdPWP/3NMWAObHvDqCbQgoCrfdAZMk40sprmlxNe8
	ft3ngJczrTsLu2fip57LuPcJkyI9waHq1/+w=
X-Received: by 2002:a05:600c:4715:b0:4b7:6b0a:a2f6 with SMTP id 5b1f17b1804b1-4bb55a963ecmr125366935e9.21.1794679836134;
        Sat, 14 Nov 2026 10:10:36 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm12637227f8f.40.2026.11.14.10.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:10:35 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Aveline Noir <jm5905938@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] mm/damon/stat: avoid 32-bit overflow in idle percentiles
Date: Sat, 14 Nov 2026 18:10:34 +0000
Message-ID: <20261114181034.2665113-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102150757.93058-5-sj@kernel.org>
References: <20261102150757.93058-5-sj@kernel.org>
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

Hi SJ, Aveline,

The value stored a few lines below has the same problem on 32-bit:

	damon_stat_idletime(region) *
	(long)c->attrs.aggr_interval / USEC_PER_MSEC;

The product is the region's idle time in microseconds, held in a 32-bit
long, so it wraps once a region has been idle for more than about 36
minutes, whatever the intervals are. The cold-end percentiles then come
out negative or wrong. Doing the multiply in s64 with div_s64() would
keep the sign and avoid it.

Hope it helps !
