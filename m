Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51B559C8B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087333; cv=none; b=JLg7++e6/fK1PQ+VqYVN4IwSnJVowHGt5P2Bt2ISk+RTAZZcfVukZ3H99OW+3fCd+ogIsoQSLLEMTk0bi6AZA0b821p04SzxEcKYWabpZDYIP0eUSyGZxUD6s9ltK/6ew51Kn/Hr8JG6ob7/wJIvbgOjbOHpIYy3rsn08YJyc+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087333; c=relaxed/simple;
	bh=vmXda7q3sDpJEX8AFmmpa4DPRcImaRBMRm6OQHAWGGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXy2upTkd9ehlzXRbTfNjgM0yDQfLDInOmFtW39j0ShVz0zsCvM2Vj1+Ixp8To+4niPsZC1Vq8rockBufumbM8rKNmNQ4oQhdy0p2YKsrEoyIWchyWBZBQcYt/97M84fId1nzU7RB/LYtV0Ctmv5yaMa7Z5o8vo6QxwhLtjf9Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VijQ3XL8; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VijQ3XL8"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c81so3625984e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087330; x=1790692130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCnqW3uWQK4vADqWc0y/sNw0Dm5EpPQnotxldEeM2YU=;
        b=VijQ3XL8mcNzlFTQCPeDqWlpAWFBrdyBLIiesM/qzOa/uiameADm5DzLR49ACYIN27
         w3ysbVpjEBSUX8ZXwH3ccjFzObRtXLANTGHvVwJ4kDPGAX5+Xy3tyJ++uJ6k97PptoSW
         tEIAkUrg657+mfUuSxRFNAqvbOLRkw2TwOvuhBCIufALBg9LJHLdCKv8+EXY5UBQljtb
         RIKrj+KdfVVhmx2q1bxH0Y6sz6xF+6TvkOZNkJDhaTeKv2JITQpHkXseSYEjTa//06wh
         0tODbO1HYl7B4zXwtEipB/SLDni+3RcfDrGIzYO7jozKH3kvnHtfcp1yxKWxHlHWLJ6y
         RikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087330; x=1790692130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tCnqW3uWQK4vADqWc0y/sNw0Dm5EpPQnotxldEeM2YU=;
        b=RasmVJGeZRBgLFGXuNdc55L9+CSt2Gj5vEBX6vfK+dHytXfHgoC2aSL6iMCbN1znEU
         j657TtdFMVj2FwTjaLSdYf1nE4FLqDRiLT9BTeeANhkICa/5aOfUKouw9yXudHDq9ub+
         3tBk1upxWkzllQPhwVRE0FIqnYO93fNPOyCUjV6RNJ07UdkmUMA4xB3GxEBdSJhjva/1
         736vFkS8u0LkL8Mg6JYJX7uFGLgxcD6fVHHSrxqAlN8SVKT6zF0hpMFoHUZAe2zbMntf
         V67byQKWPRE+VMM42eHxoCJmYJJvUuExKDv+egCui91gRr0urUWN274U9Ow5/W8YG4AA
         rXWA==
X-Forwarded-Encrypted: i=1; AKwUvBz6WNQqMf+CzRb7khRnhgQlaHxPayFZUvJYRlwgHe/EKXAKrMlnoRksbAFo0Hs2r9Mguk/prIwtBVP+Cvk=@vger.kernel.org
X-Gm-Message-State: AFuF++lOY+AWgJits8OwcrhiQGlAVjkMqSlPD81rM4DR/pgpyhxUr8EH
	F2oQcqAiuWi2eg/Rb0YH8kMHsR6/OsxxHRdaZ+98jLayFAL1nWOJ0eWr
X-Gm-Gg: AYBFou1CSGTJLiZzspYEQhjaXeUUYPMaWypd0yB1+GfAKZ3/PX6g9w4DgcP3EvItvA2
	9UgxF/zWPwnGuRBJGMHzAK9JbypOur0B4WIYwkWpPadkKRDed7+9Bz5uNiUx3LuYamGwsYRq1+P
	02AZZaL+yVVVrhbIhxNgM7AxGNdwcHHdk/dQz4AhBtLryd9bO2YbwLsI026a0QJ2Z/NhpiG5857
	fEtj4uuac4FiZEdIrS0bxdngFF94/EP9Pj7CjRl1zUqVJhSjwmjSrasdX7yL3h+ArAR20/l90SE
	FCdjsjdAKR/z0n7ZG43BYYaVECu9QpZ851yg30iV8qYhrHkzR1w6w6rx9Z5qtBILdfczc8SQsGq
	vrAAtXvjz2piu3ofwmzWbwJ2AzHXntCfx8mrkH3e51rRqmpmj6xjx5CmR8LwGELnEGySf0vroKH
	uDMrv5T1M3+aQeUzCrUBNxo51MzgNXSvIJr4hlQWJqxsvVHSXXNlntXdFucFlsw9tjYVkxR0c51
	YHNCe6pr5KZzvn6zz0l6nkQuaK+Wg9p6jtvmcZd
X-Received: by 2002:a05:6512:3b2a:b0:5b6:1a81:1c8d with SMTP id 2adb3069b0e04-5b8c197976cmr4302647e87.66.1790087328717;
        Tue, 22 Sep 2026 07:28:48 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d2064sm589691e87.24.2026.09.22.07.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:28:48 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>,
	netdev-bot+sashiko@kernel.org
Subject: [PATCH net-next 6/9] ptp: ocp: report fw.cpld with an empty value until the USERCODE is read
Date: Tue, 22 Sep 2026 17:28:26 +0300
Message-ID: <20260922142829.57740-7-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260922142829.57740-1-maimon.sagi@gmail.com>
References: <20260922142829.57740-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fw.cpld running version was published as the literal string "unknown"
before the USERCODE had been read, which contradicts both the changelog
and the .rst entry describing it as the USERCODE formatted as 0x%08x, and
is not a version anyone can use.

The string was there because naming the component is what lets
"devlink dev flash ... component fw.cpld" through, and a part left holding
a bad image answers neither READ_ID nor READ_USERCODE - gating the
component on the read would make exactly that state unrecoverable.

An empty value gives both: devlink_info_version_put() invokes its
version_cb, which is what devlink_flash_component_get() collects names
with, before returning early on an empty value, so the component stays
flashable while no version attribute is emitted.

Suggested-by: netdev-bot+sashiko@kernel.org
Fixes: a4b7c15aa78f ("ptp: ocp: add TAP CPLD flashing via devlink")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index e10f6b5149c9..4ce86df6e196 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2264,15 +2264,20 @@ ptp_ocp_devlink_info_get(struct devlink *devlink, struct devlink_info_req *req,
 		/* The flashable component.  Naming it here is what lets
 		 * "devlink dev flash ... component fw.cpld" through, as the
 		 * core matches the name against the versions reported here,
-		 * so it is reported for every board that has the part and not
+		 * so it is named for every board that has the part and not
 		 * only once its USERCODE has been read: a part left holding a
 		 * bad image answers neither, and gating the component on the
 		 * read would make that state unrecoverable.
+		 *
+		 * An empty value still registers the name with the core -
+		 * devlink_info_version_put() runs its version_cb before the
+		 * empty-value early-out - while emitting no version attribute,
+		 * so nothing is published until the USERCODE has been read.
 		 */
 		if (smp_load_acquire(&bp->cpld_usercode_ok))
 			sprintf(buf, "0x%08x", READ_ONCE(bp->cpld_usercode));
 		else
-			strscpy(buf, "unknown", sizeof(buf));
+			buf[0] = '\0';
 		err = devlink_info_version_running_put_ext(req, "fw.cpld", buf,
 							   ver_type);
 		if (err)
-- 
2.47.0

