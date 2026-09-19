Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBC23B9610
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789805333; cv=none; b=OH9W/L7r6wlMu8OAfeZeeotQLUAC3ZUdrN3tqve9Nm1Z9GQKC/YhraiJJIepXcfSals7DMzPGX8ouRDqv0i8Osqvj1E1caM8GnBT8w/eygONtcrpNltgHrbKfEWKSuvs8I0TLYGc65HuWWEo7WmG1IA4jI1TEyT61jBXUBOTnEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789805333; c=relaxed/simple;
	bh=ib6RrwaF8264n/SLla5qex79A7ENGDfeGW8kW+nqFxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlluS1RRvASqv8gzpUejWOkP+dJHlSR4FEZe7hi9vof+qyEH/NnatQvCsxsOkvyRd5Za/Qgo3LU1x/qwpBTlmu6hV7A1xg/2/LGuknakmXZtR0ofhiws4IOQzmGX6GhenRqYg8rclYopdRbv+r1sdIs7l6EJ8sBJoa8YTihUvZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHVUbjHy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHVUbjHy"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso1624198a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789805331; x=1790410131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVrPSQXkAQAeBNMiZeNw0hR8rd7g3NRpI+w/G9sv39Y=;
        b=pHVUbjHylnUqUVRBHfw7yUJu/NrqrT7H7n4JW2uA6xqSvHJ/CvpnTYuVrD+M/cUvQk
         0rreVrn3fhgggP0EyBd51iNf4qjY309lSoRFm1flVhGQtWBoOBHl4pdjMeJcFrUiBMLB
         Igikw/DccTodkJprkHdj7vyHzO8TlLuElJ1ewqpmivnRg5pCa+4FF4DPplogP/qEQk6C
         lti4s+ITQWKTtbxcvPKWUZP+o814G+1a6WTnJUzUg/QG3key5DlHRGBTR5zDwmdzU7bH
         4UV01sbzvYkEtGY6XdlRgjiiPwwpnW5Z4ZRAEO4R7YteCNCvmM7SBMDapfMlUwoywIZm
         0WiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789805331; x=1790410131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVrPSQXkAQAeBNMiZeNw0hR8rd7g3NRpI+w/G9sv39Y=;
        b=2sbWGYcDLR4aPfLGDV5VxjTs3Owvlv5weppyhXNTmBringiRRcBwoMBdxErzqrecEf
         F+Ou2zbisU2K519UeVEpneP6LLXvOAdnB+75V/z4qagzMZlGUx7A9M34lsu+V24MBuu7
         emIWzq3dJaxi+wBhofzQRgaW4pD4JkE0z49T1iZE4dEH7H4Unx62qfG/7mLy5bw51Dzo
         d5uvzYwb+UYVOnEBCs40phjCpo0uurwbI1j1KOxeLaI6p2S15k/8+x9e5nTDoqBEiV4h
         he7a/aktAmmIQBVt8/QVd4+3tigVPagDdk1yefkLRB5sEL0LqUZNIe0wl+CAbVX0bR+j
         YxCg==
X-Forwarded-Encrypted: i=1; AKwUvBw8RNDgdFSXXh841iOi++RFmXO1fduogZcF1VA6CK4YVeVqCcrZvdpE0REV1Exlf7sQuZabJCRupQ5iiFI=@vger.kernel.org
X-Gm-Message-State: AFuF++l8MlYWzydbxfww2XjRNfF+svB3V47KTZvHgnqrkCAZm/l0veMt
	LbMf9hMCDiHLqcy9nDGAsCVQdJU+8STiJ51kdjJ1Bz7Ia//xzF76EiWM
X-Gm-Gg: AYBFou09MuY07Fjnrlwd2RWJHXUCOVNpTDLb5CDJX1+GCbC9aQBx0oTwT2aktx0PflC
	hTh9VynhvgczHVDzkDX+yYFWFNnQGcxqGchjQfy24zUgbFeHCxyT3L+BQ8uQBVuhBSr9lxxuqE/
	xZvEbbzr7SvMdgc8BOqj0MYh81Xbym91YAYSjNsXDIGqyYkdkfLHy4zqSAJtJN3eI8c09vPCC2I
	DMcbU6INmxlO2rZ8uPAglltIxVryGRIDG7B131vAty4DeDJ6Ez5rbqvv/XE54jRTuRh+v9CbyUy
	pI6p0OULIQkEu/aFWLIf2R2Xut+rWinAyLRlClfwSVGZPxjSr8jnxvu1Wij+rUezYVVAIDysrGp
	fvmnE+N/n467uzXJVhAcG/0eIoqnHz2++ZqekS3Go1dur4r7ekF9yUwlidFgy6Iygcy0OoRqtJa
	9DsDeAJOnQO83xQIjqXJ5DyYTKw+HExQdvD2b+U1djMPMKYp2gguJeiejdfasjclY/jMRTkMLGn
	vkdSdAuYTlmyt7wfixbOE8IzACYhx10ILIKQev/vBPeoOOGseVb0pt6EMELAg4XeSk6286p3Cm/
	/qz6hsSAUw==
X-Received: by 2002:a17:90b:2f0c:b0:39d:eda9:febf with SMTP id 98e67ed59e1d1-39e54ea5e7dmr10323255a91.18.1789805331369;
        Sat, 19 Sep 2026 01:08:51 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6f1835adsm2998296a91.6.2026.09.19.01.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:08:51 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH 2/2] nsfs: fix namespace reference leak on unsupported ns_type in nsfs_fh_to_dentry()
Date: Sat, 19 Sep 2026 08:08:50 +0000
Message-ID: <20260919080850.3005810-2-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919080850.3005810-1-benquike@gmail.com>
References: <20260919080850.3005810-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nsfs_fh_to_dentry(), ns_get_unless_inactive(ns) acquires an active
reference to ns before switching on ns->ns_type. Unlike the CLONE_NEWPID
error path and the owning_ns permission error path, the default: branch
returns ERR_PTR(-EOPNOTSUPP) without calling ns->ops->put(ns), leaking
the namespace reference.

Call ns->ops->put(ns) before returning ERR_PTR(-EOPNOTSUPP) in the
default: branch.

Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 fs/nsfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nsfs.c b/fs/nsfs.c
index a1842e12f..e9cc09583 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -624,6 +624,7 @@
 		break;
 #endif
 	default:
+		ns->ops->put(ns);
 		return ERR_PTR(-EOPNOTSUPP);
 	}
 
-- 
2.43.0
