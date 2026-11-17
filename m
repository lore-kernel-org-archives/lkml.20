Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925556;
	b=nfeiQGUrVHEtENXGLFCs8+YTN9aq35lf5Qe6rRCfRuQNECD8GDTMO15ANvdajXlfp6i3
	 hp8wyzUKRh4ldaNLwErlr1E6WR/IHSfjZvqEmILcnTWEuJZ1peyMyIId+W5QLmFoXcewZ
	 7RAexTsLCHy00Hv7B477IJLV8Byg1GWBsFTEV4My6pzklcAjeEQNIlhJwJvT4C3AMo1UW
	 Vsuu3fP8WXzReVH56VAOVz6VHbdaZ9CcoiAWEzpsOwtI1lz/fkcLmJnQlMnK1QYnQJqyj
	 Nl89MzD2IDrEc5Kq104eaYGKvagMxkRGkms7LJzlEBiJY8ZlEAyYptR+VZhldCNwCtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qTTU/HttU3fjnx/LLkySkKgelZHAjJmF566oK0Z4Ap4=;
	b=IxcLTf59NwP0TWfGyfkuIA1BmLSmWw4n5Jebq8g8trpOU5xuj+uythkjnAM/KjPkgSMx
	 GqpNkUcYyIA44y57m4HMSMJYDfwU4ajy9Hq6Tti02AfI0wbi4tFQIU3vVtcaF+WTyhHvG
	 Kq9othuCDuQ6vW1mtMApP7CWqfyGG5U6GZi8TGl9Z1LRm+zVUqV1g2VQElhfLVcDrYu7N
	 RdnTFYeLUIPz8UjL4iH2svV9YvtQL9ax9loei3GDt5wATPlXkeOMDAOmVqmNFOaZw3MIn
	 KYNv4BrQBkvevoZRB+EIUTZNDi0MXz9TnoYyRX8UtdY1hwFxicQoZ2ScejbqCXyUS5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mjZj2Wvh;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3170F606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3170F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mjZj2Wvh
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71af0656bedso1300658eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925555; x=1795530355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTTU/HttU3fjnx/LLkySkKgelZHAjJmF566oK0Z4Ap4=;
        b=mjZj2Wvhjog8aodOeIvpWtVJoReEW/rQXMk51ee9WBi+rUO6vOcSUYfWHVY0CJV5xl
         IB6Xv7Bz7J8LtKr+Uyzc1EmzHQn8PvPzLAQk84NyTmVmNzzplhO7WcRqHGtew5lqZx0f
         VU5G0NpVqsE4IwcNG6JAmJpGnJvnI7tVR0nnCIEYrQnXhxRJU1yuTESAQ4XXcpXvRSka
         keLtcQw/UA+RFkxFeerXWnjTyemXZMI5WADUU/1O9ec5066n/DK/jFyM54oCeF78CePs
         T+5anJL/92y8GVKAe+eEFyEdukIgCXJGYTY3JP157/bT8uXo8JjPSmpYF+821GaYybo6
         1jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925555; x=1795530355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTTU/HttU3fjnx/LLkySkKgelZHAjJmF566oK0Z4Ap4=;
        b=xlgUT2hXSHA5C2du1NYshpmlxiV0YkbZwt3QGdO73UoykGL/w7jQ3pIHaZz8icOSc/
         lmVczDKGn1r2b00W4WjdZoL3l7zRCbvkBqXuV3lSHTobFsrwviZj4wsjU/ma/gCOVeAX
         iUYcYP39ytyFCTWH7+SnEXQgSxrUcvhjD5VxZqiZHlbJ0oQiZ78kQqgUE8t1hkJyijm2
         B8peqJRyQPChO7/DZl5e8ydcLgMgAnhuYDvvbkuMhRGrBLof0VBl+WzxlHNlOliyUo54
         KYmSNSNdUwXDiTOOf5uZRhzaKfFI7Ewd5pxl0xsTVBWudtrw154hzNneU810gILGlUZa
         0VYA==
X-Forwarded-Encrypted: i=1; AL+hErHJa1mBuXxMCvniW/YVuXJVfDaake8GR2aM2rH93mXDF5QJCowQJ04v+Nel0Apnzt62Zl0MqJiTpvNsQBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZsR2T3HfK/8U6M7QhJlhuzHjMhZheOVDx2nFta8hImBU/BWTD
	QyE9a0yUTFeV8/Aci0Emyc2WzHnbAeA8L+xOxnoKZb7T2KBZJp7jkc6D
X-Gm-Gg: AYBFou0O06bfXwFE5Lu4djX1muh4zAcmlAPDCbUFcShqKPaIfSGH3Tgi+L0o8VPHaP+
	NVPABvxKPKSIVKFNsFO3jgDnd/ypBiYBs8WbGQHSyko+YUIzK9CsgMg5Xj7d4UgR5kjCqoIgi0R
	JcX9uf0AsTstP+eGLfJtPRh24hBvlaoyL8j0jSipuj6Yk+Z/YawijXr4Q8Tc3big6cSYGeUwbMo
	P0EnuzSBbGvguYQJI3KBGHCoH1J+PBKhPNKQMu4cJcjySiJTBzDdl3Mw8INf5aP52Uw4b1DHfa5
	RzL2zu0TV0nosi6XSNlrMfleU8oLGx1Dc+9NGFln+9HSuYkGMZ4MgvZEfN3YbNQxnEwvp+9U+J2
	hkC/C+wmhGN/0F5Pt4zPyqs5ALjIGRlzCNlCsVylUlr0BjWVO61PuXV7TmBkDag/BBB8NjSY+c5
	2r7P2iyl7eBl48XmdYXaQ0ZJXElhQp4CTMTZLKsIhfbuhd9alueRuKe1ax6/R/Nntv9jGbmuHqd
	0UcwdNCLZJVhwbqFzG/JKqj7iBpWZWOBTDePnkqCmRQkHdvgzPCih+Hbqxmykd9ir0L3T9YwDRs
	aNbvlJFSsgwdB8y0qqYE9fyoWydiMumFTQI=
X-Received: by 2002:a05:6820:1353:b0:719:1ad8:a34a with SMTP id 006d021491bc7-71ab51ad506mr8840255eaf.67.1794925555161;
        Tue, 17 Nov 2026 06:25:55 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71af0a8a18csm5313709eaf.4.2026.11.17.06.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:25:54 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCHv2 4/4] powerpc/kvm-hv-pmu: Free hostwide stats buffers if perf_pmu_register() fails
Date: Tue, 17 Nov 2026 19:55:20 +0530
Message-Id: <f26a80d822ddfceb926aa732deb96e81c40dd2f9.1794924821.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794924821.git.ritesh.list@gmail.com>
References: <cover.1794924821.git.ritesh.list@gmail.com>
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

kvmppc_register_pmu() calls kvmppc_init_hostwide(), which allocates
gsm_l0_stats and gsb_l0_stats. It then registers the pmu. If
perf_pmu_register() fails we return without freeing them.

Call kvmppc_cleanup_hostwide() on that error path.

Fixes: f0c9c49c5067 ("powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters")
Cc: stable@vger.kernel.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/perf/kvm-hv-pmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
index a58634f656e9..ec05b4855736 100644
--- a/arch/powerpc/perf/kvm-hv-pmu.c
+++ b/arch/powerpc/perf/kvm-hv-pmu.c
@@ -402,8 +402,10 @@ static int __init kvmppc_register_pmu(void)

 		/* Register the pmu */
 		rc = perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name, -1);
-		if (rc)
+		if (rc) {
+			kvmppc_cleanup_hostwide();
 			goto out;
+		}

 		pr_info("Registered kvm-hv pmu");
 	}
--
2.39.5

