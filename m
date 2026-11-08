Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127657;
	b=RfmKp08fsgtVYUM0HXJsMX1+zqXGvvqmULHp9mXe9PqIzVFmD9yElmG1k/OmryN13aMR
	 BZf6YC6m7ciyAWFKzRXYR36hCQJqjmM8g+JmfsyeN3uCxEPUmy76sckxiYgI0pk8hLolB
	 ByzJhuVQK59YGMwG0lOvTFp8CjY4luzkVE2PZeWokQ9dDO4xLs/3TV95auEQkzaU8+gFA
	 mQonNzYoiLI+u4zljrFqmTxBEMyb4mfXCYcoGh8cPtOAD4Pa0ijoYnTcvoiGCc5TUNnII
	 xy+yNDlWfTdaRl5EOX2Rzf57LcKqrViiunvXztxutRIL4LygWJT1pj1V478xn+uw7TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=oImRzjWDz8Wxxig3JSKCeNvDBZv9ghzuzFbbGiNLN58=;
	b=JQZYkrUJXlQCD84Nq10/eSNixhv7Tpnb5N2TtqgOqWIOkPbE/BLWP7ZgP5DyNKX0SWnt
	 wB+o1hx2vBZ/qt5FQDBm8J6FtltNz3j7EssBejbvi+qpCKjxm8rsOedhzBT+4vNMRitfJ
	 klxjCmvdAsbz2B8Pf6kbnVkp1QPf/7ecArpWj5EJgIBi1QKgNwbTH5QajQEJtSAAG92PG
	 v3Y9WK0zPx5DrVJAt0GvNcOzM3BZRFi4xH/ze740vPlndjDh4UdN0U3Pwx7mo5zEO3z3N
	 0Q1exQif642oIeDq1uQA/ZSlJXUwqchaxVQwecQcfcdkRE3xopJ8HrP//jhAlxMSbQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=drMYhROL;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAE1606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DAE1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=drMYhROL
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9e53d011eso1182845ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794127656; x=1794732456; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oImRzjWDz8Wxxig3JSKCeNvDBZv9ghzuzFbbGiNLN58=;
        b=drMYhROLQAzQQ0rCvGEW7U6+4IS+QEXz/+0FkEIiLobw7IaBIVdyXViS1ICHUVrB5e
         bQSZVXmdMJ/FHLzna2uXzpaACX1RrMI8fEQg+In6z3kQVB3rbAs5i+Y4sk1uCE3jruNU
         At/6FWAaHlS1dN4I7SabSoDcdqgB87zdbm9jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127656; x=1794732456;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oImRzjWDz8Wxxig3JSKCeNvDBZv9ghzuzFbbGiNLN58=;
        b=e032u0p5G9XAazC2ho14ck3/r/hGKSmK6ytP9n9Q4vGjsPPZ7PUtf/XR4yKKQCWb43
         CY0mGQQdhrO/QU/gjCQuvYHI1JVXDetIZkW7umSeE8hzVRDEQQag+LL1s4Kmvkjb+SFa
         jTF4XFeH2Wy+/jVxQWGmMHzABnUqEBWOVktd7MgWupa81guBFPLuAdOsMh4Q/+N7pDBf
         ++36UftlCGZNQd+DcUYsIYYhPrfrlhXXTy7hw4Yv0qnHqSvAFcHlVxMc7x5mMfO6Cuhx
         AeiWVqZpPSnhxnq9q1s/W5wx4BaPtgbOr46/0C+Z9tevieZ5pMO7yv3qXgX/rnHXn8v1
         aDng==
X-Forwarded-Encrypted: i=1; AL+hErE3CEbl+IManMeTsLeEZbFayyoCy0TlWC77c04sQrD+PNsos2/AeqdzR0sHN9LPbNI8oGU/Xgrn6ZDZnAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+5sQTKkew3vHeoUK9+QdLGuYJCmcAwiicpSzIRi+8zUcc0Rzv
	tKMhDKpzZq8GQPl1NwjbrJFtvz5+jEAQezWN/IbGVacTZNAapGdgNScUvMhFW0S4N2A=
X-Gm-Gg: AYBFou3GXm+KX6spMH8geySnm2ONAPGVTywBEXatPTOzUrEtAf4yyLUgbYFO5dOF4/B
	LQmyi1ACV6ohgsg2ZctlDldffRVow3IOSPeCvswxUZLsotQqLeWPUjfg3zZeDAiV30ph4snYgHg
	pOd7KclVuB21GMLNO3++CbjeS/Lbf69XNGMajmPUbsaOybfV4aAx+Bu7ZpV3KOYT0ehVmrNSY1x
	OVElutmtj+h05okDkezntXCEbrl73Umg+s6rZo+v+uxQf9tgBki3/6UnXydFto4ecB6mKsuxuUe
	HWc5BDiwoEikEVnr8Nof0ALPkPKBwwaNF3ZD1E2M9gPWVpQPgaagAMwM6sDOxxg6aSGrHsTykqS
	soOjAwPcMf4rwue6xjhIgdF1m2i9N9/GcpYkS18/Bvu5/D8mXUa27qfPD1vAJbuobGcnmt6OIgE
	uQqgCEekNo9Ijxwo1YiFpH2qMeGfdXNhuq3D+yhk2LwXxEcOhXPKbJluK6qQ31dxhQQpu1Rze9X
	xSDK2j4QL6NKIKtkAbykww0DwvG/BmM0AEaKdu1SeIDXNJLjSa+rHq6KOiHM7O4TjlkDrX43Dos
	O3/kS+XEiZZ5eLD2eKgTfAE6oGe0baRe3LE7NkLQqKubxJsE5Jxp4LtWDlMKH24PY2lqFpVtjmZ
	WdXasFMjUkHY0jVGb5HRKYfAxjquYCRltSW7NfGtNi56s6JfMvlH9GponpXkbjqVHZ/vrIla4rk
	SoN08fAoEX6nebu46Kp5nX6RggvbU0pAWY6UNFXiVqu2bTN65bnR53
X-Received: by 2002:a17:902:ec8b:b0:2ed:3f47:9699 with SMTP id d9443c01a7336-2ed837dab45mr8233875ad.38.1794127655733;
        Sun, 08 Nov 2026 00:47:35 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e72acsm3030105ad.13.2026.11.08.00.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:47:35 -0800 (PST)
Date: Sun, 8 Nov 2026 00:47:33 -0800
From: Chris Down <chris@chrisdown.name>
To: Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] md/raid10: Prevent data corruption after a rejected
 backwards reshape
Message-ID: <avA3JQ6lyAlMm1Q8@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

A rejected backwards RAID10 reshape can leave the array using the
requested geometry because raid10_start_reshape() updates conf->geo
before checking whether the new geometry can hold the current array
size. If the check fails, we return -EINVAL with the new geometry still
in place. Subsequent I/O then uses a layout the data hasn't been moved
to, so reads can return the wrong data and writes can silently corrupt
the array.

To fix this, let's take the existing abort path to restore the old
geometry.

Fixes: 3ea7daa5d7fd ("md/raid10: add reshape support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/md/raid10.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 066c43154497..4ade0cf3281f 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -4393,7 +4393,8 @@ static int raid10_start_reshape(struct mddev *mddev)
 			spin_unlock_irq(&conf->device_lock);
 			pr_warn("md/raid10:%s: array size must be reduce before number of disks\n",
 				mdname(mddev));
-			return -EINVAL;
+			ret = -EINVAL;
+			goto abort;
 		}
 		mddev->resync_max_sectors = size;
 		conf->reshape_progress = size;

base-commit: 47e1b18f38d74015cb9fd30b5ff2a1eb88e77d31
