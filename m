Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79704409280
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629491; cv=none; b=Wg6mGt5j0eebcWRgaHhFFcZtmrtPZAjC0iwNPJE6a7H0vIWCtxznrxgL8Bl/vphIl8BtDv2iasTJ434sAHhIjn9DPWdebeXhb/Q+wbFJC57zhR73UirnoL6QhHKAnP8KXc4oCcWtk13EZbZLvz4yWQwNbaWQ+s+U7n1UwjQcXUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629491; c=relaxed/simple;
	bh=u8KE7tOv1NAK+yYw3Pg7PLgziE5oKxWQEikBeXkrfbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fvrn+IWPmQfh7c2ngCwllbFSoJ6Nmd/8Px6oRYI1vDIBjpVhffkf4NYtHQj/DYaoKk41nfVKqcV1+Qo3a5yMaOJyxkOTK+1oXVPlAJZjK32FDzJZQR4g5Ysttkx1ufjtuAfWUiEfjzSI5YhJDeWABVO+Cj5a4xAWMqMebNE8tt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IG18jHqv; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IG18jHqv"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c263415982eso74582866b.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629486; x=1792234286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ko6JSjHDJVAp75wXxPV5/JTHWYjHqaA5e9bKEbYokVk=;
        b=IG18jHqvAcWq0VY4ctOKYHsvnxbK0ze1pKc6un1v17P2km5XtJOGk3ZSSSa/iXaGpK
         qaXdXS096BL6CrcPBj6VrAnzokBKqU7m2QExthwZ2zzwTQ3fjtTUkqrHKQxQwMMgHCRS
         i2xp03S5uFno3QrfhiD37DCv4BzCDKtFrHUub1K3k9tPYDGaCqCQ2hPeC0Xfe4wGM1iu
         Zo6DZ+uYfyvoE+vM9mvDZN0SjEabiSmvVjIkdBueixaJ7YPVo/GfSRUPA/0FS+TEO/I3
         Su/ZICTX7gWhgthY3uPJeKGuTJrpt81VNzRnHd/+K16MTFbrPxR7Hq5ELnXtkj9/Q7yy
         q4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629486; x=1792234286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ko6JSjHDJVAp75wXxPV5/JTHWYjHqaA5e9bKEbYokVk=;
        b=hSc81dyxBr/ErTYPvXselHhZW7VUdjq077jnVOnyr9u73pU0srUCWnQGRbS3DMtHbO
         MW8RF6oYmfg2OrfKP5oUojXFaj6/yrERiGyPubtNrbNiYocgHWPbCldRN6S8u8MYdOE9
         v6zO0on5IIlvC7Bx5wJ0kw6rIkUqMzfmqmdIadPjFlf5d82eJXsrJISzSaMaCaD9AZAy
         CzW/PwGbXiNTg/04t7IbsPBNYtWfYd8+hX0zAZL6ipCv0WflLGSEK+OjpoTQXN0ggCH8
         yekqe7/K8GMkkBtK6kelQcLtRljPO1IrPRBN7TIYLSnjoGMGHW7tKFdlFexOlTXoR3eO
         1zfw==
X-Forwarded-Encrypted: i=1; AKwUvBwM9WEfS9ISDr2/YWh/X/O9skJtCET7JHrMEyRdEJ6CXLjbo15yhgXS80N2KYVgcu36Cze9Y7UEvq/0nzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHYMoNPkkobMZWe6lWa0W8+j6Ys07buWlqmZ7bFTYrD8rxFoMs
	QEcaHONzTwE+XAqiU6+DBmT9eADm7X0cyFGKZVn5068fdFzM6H6axLp8
X-Gm-Gg: AYBFou3vTFkg0GeS1mdsFozdeLuLRq04SV14bG+2AxU8+Vf7qL+ZbbchO+1yD9PNCUg
	0fdWATtH0oobKkJH8aRQAUldgf+ocmfqdFTFGmwHXW/yUW9PRAW4RO8qJr8wHOFMQPuI6N+PMF1
	fXU9lSe5aiClILHBtY7JPq6yM2nEPFGcXxh3J66GaiM9ZKLJ2mqpKO6zWt6znvDltLiZzwSlUEO
	zio5hEU8OC7apP9iB6H/0KH2yxx6tmbzHcQ3hOghy6TmSjIQ/6yOsiFJDvwh/4LTz8TPs4Xp3V2
	B9Ga8et7ht1Y4qDeq2gC1z37GXlhlYd5wU8CqlG41QkudQKSjrErtOcGAKzXcvhkktzJQcE8Lf+
	zwzJcVir40LejAMvLmmuKhYHrnfdQQsptT78xNjzzhvhnwoNwwWus02IjaIir7XOE5D5KvjEQrF
	5NJMHmxcSQRLeMoFUuWuuAfDs5IcupwbsDLKj2yZC+M7rVcL3oG8RWs9Niws9oAfAuRCciPzi+d
	FWno2RGPYSrC3zrllOC/LGBfJ0KznXVQ2u2mkgodhY2CXdxSSMI2o+9B/QzdgJuJim6Gc2uLEBU
	26ROEvupnAtB//4=
X-Received: by 2002:a17:907:3d4a:b0:c26:22ae:b66b with SMTP id a640c23a62f3a-c31a9fa1d4amr470333766b.15.1791629486397;
        Sat, 10 Oct 2026 03:51:26 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766743sm229984566b.4.2026.10.10.03.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:51:26 -0700 (PDT)
From: illofspeed <volvo.mail@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dm zoned: back off when reclaim finds no destination zone
Date: Sat, 10 Oct 2026 12:51:20 +0200
Message-ID: <20261010105122.398-2-volvo.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010105122.398-1-volvo.mail@gmail.com>
References: <20261010105122.398-1-volvo.mail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When dmz_do_reclaim() fails with -ENOSPC because no free zone is
available to copy the data into, dmz_reclaim_work() still ends with
dmz_schedule_reclaim(). If the target is idle, dmz_should_reclaim()
keeps returning true, the work is queued again with no delay and the
worker spins on the same failing pass.

Re-arm the idle poll instead, so that reclaim is retried after
DMZ_IDLE_PERIOD. The next patch makes -ENOSPC the expected result when
an idle target has random zones but no free sequential zone.

Tested on a 7.2.6 kernel as an out-of-tree dm-zoned module, together
with the next two patches, on emulated host-managed drives (tcmu-runner
ZBC handler) and on three 27 TB host-managed drives used as md RAID5
members.

Assisted-by: LLM
Signed-off-by: illofspeed <volvo.mail@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index c041413c729..315f0da99f3 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -540,6 +540,14 @@ static void dmz_reclaim_work(struct work_struct *work)
 	if (ret && ret != -EINTR) {
 		if (!dmz_check_dev(zmd))
 			return;
+		if (ret == -ENOSPC) {
+			/*
+			 * No zone to copy into: nothing can progress now.
+			 * Rescheduling immediately would spin; poll instead.
+			 */
+			mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
+			return;
+		}
 	}
 
 	dmz_schedule_reclaim(zrc);
-- 
2.43.0

