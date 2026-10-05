Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC2C4F93CC;
	Mon,  5 Oct 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220640; cv=none; b=YZZC/stuYcdVJund6WORqn8JoZK6Orap2A7xU0922rZi64c3iSR86EkYyA59B5fjyvnBdnd3qF+JRdIociCujy0fkI7mx8vBirl8CalilIH6htIl0XoPHn6cDqQ8xC8Rz512AGTQkOoZueMlG6iVIye/2wQeOpV0OUMchyELO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220640; c=relaxed/simple;
	bh=JiPwOjTQfmLBkJDnTPwE+8iI/sfVW0pkk+N8O5EN3QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjzTobf6q471OQJ+agsX/tHWSqFuEqrEk6HXBQ/h7nYC8zzE1Ea3QhBFXFRzoIhmjp8suWhcyqVH3t8SxQstjDy19EObp3BuAhKTwAk9Ifbf1LCSp0zhfG0rjAPjO1EdSBYlWJZXsFySBqs1wXcJmnkIU+8QJCUL9N8MJQ1Wcxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdcSRihN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdcSRihN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098DA1F000FF;
	Mon,  5 Oct 2026 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220639;
	bh=NBEcMdzi71ulncC0DzS/17JODudw9/l92Pky4sOYNXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YdcSRihNdrqvdT9a4tGvv2UjRQCpOaen0V2nsSToq9SF8ecD3HMVeA+/Udrh5xcpF
	 r2ODVIjgfQZF3mJ4eD0rzzirpJLHXaTSq+28991Hd49AFb9fYPj16XbmR2A/b0SCZ8
	 O7e6LJvLhZ/IgJWj+MWCSeXHdXkweqjcbCIXLLMUuzliDhj22o6q3HBE21rM27PaSG
	 I0a/l9DdQ/IDJygHHBwQ+Eqs4cDcg69Zwse+cnhCYgQ2SKpPWJRkz/5EaPKsS5A9BG
	 mSLEMWW/DRvdLn/5BtBTwiJfA6ID5N/Cnwg0339fcwLDXVALZAqxgj1anvJ/B+x1kh
	 SV2LNB+57hDeQ==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:57 +0200
Subject: [PATCH 27/74] media: qcom: camss: vfe: Move legacy VFE bus client
 assignment to msm_vfe_subdev_init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-27-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735; i=bod@kernel.org;
 h=from:subject:message-id; bh=JiPwOjTQfmLBkJDnTPwE+8iI/sfVW0pkk+N8O5EN3QE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sTb9VTFOskUb7bsjCg3NC8M0DMOHwaPogWU
 50nyigKDdaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbEwAKCRAicTuzoY3I
 OtIpEAC9yyfcZABSEe++ZgaBIt7knHq0tLiu6RWj5RM+oe+Xwt3eZ7akLwzJHwK+C8GtPVKl4zA
 Gcusu1+BuSWCncdGv18eRqppqc4W7A4p/O0YTK0NZraKIkL54qCnbF7YMieyBu8tR0uwalO2ZMz
 +IdFi+lZqjj2SjP0sRHeQKtp7352HlIIziyhQQ2eGlxKrjYqtFJ5YC4DjBhTIS/m0k3obHevo31
 G2V7jDw1yUNmkfA+PtONaRPbSQqM+/dBL1O19kwQFLOHvmFmzYUJCIShu9IoEx2Od7QBzDqm0+p
 cmIe1ZOiHjeu1JdXAryOxaUsHE/b6DxHUFUXqviFF/FYjGFrMOsnZ/dJLlNqtO3VyN6BGPQ2KM6
 qt68sjkVN5wnks50r8rA6Gj1XHrMAadLc9uqFjLjA9KrD2y5ExMP0opjx/y+e77m2tqnJFH6bLk
 +/Vonsh8kE8G8ufKKDxVoGA20Gunn/gj+31ouVfJiqMOxXLFaDbrrakvx2m8nErBWvxYsLwpZo6
 72b0X7hQV211WYFpGN99WX5+H/6dGFMvNhDFVYfwCwMJb3E/t8OXD1K/qGqGUZe6Ir5lg8oepK4
 CEboXa096HX4CN/Hrmj6dkWoAIRRRlzKz3QYClF+Bi5q4wEq70Mg+OWzkTSSucxFEwE2y/fNxpb
 25C5WNj8G5YH1xw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Initialising core elements of a logical structure shouldn't be done in
get(). For the fixed RDI logic assigning the write-index in get() is 100%
redundant. For the expanded PIX path the assignment itself will be wrong.

Move the legacy assignment out of get() and into subdev_init().

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 667cda379be44..35ab3203d75af 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -802,13 +802,6 @@ int vfe_get_output_v2(struct vfe_line *line)
 		goto error;
 	}
 
-	output->wm_num = 1;
-
-	/* Correspondence between VFE line number and WM number.
-	 * line 0 -> RDI 0, line 1 -> RDI1, line 2 -> RDI2, line 3 -> PIX/RDI3
-	 * Note this 1:1 mapping will not work for PIX streams.
-	 */
-	output->wm[0].bus_client = line->id;
 	vfe->wm_output_map[line->id] = line->id;
 
 	output->drop_update_idx = 0;
@@ -2054,6 +2047,9 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		l->num_outputs = 1;
 		l->output[0].line = l;
 
+		l->output[0].wm_num = 1;
+		l->output[0].wm[0].bus_client = l->id;
+
 		init_completion(&l->output[0].sof);
 		init_completion(&l->output[0].reg_update);
 
@@ -2064,6 +2060,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 			l->nformats = res->vfe.formats_rdi->nformats;
 			l->formats = res->vfe.formats_rdi->formats;
 		}
+
 	}
 
 	vfe->res->hw_ops->subdev_init(dev, vfe);

-- 
2.55.0

