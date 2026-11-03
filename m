Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675112;
	b=q45eu+uLOjFF0kDUobGyE0q/jQZfoFEzXgOb5Zee5MQMlg5yC2Pm1NeJOrDfMCtZkWV8
	 Zl96AzzewDs7rasR007zWa172aHHedTSyDpetw/qf45w3DTHGuxIFM/a6S+QZnQ8MP+Qx
	 97683nn8Lo7ilir4PsDVcVDzfsxjGpszu4IOPUFS6AnjKxZWYE0dAmKBQELbvQsuDQ4Pq
	 yNlcOF+ukUYq1hBOvbOR8hz64pQqNjUXGB/+rE0XoZVBYfXua1CwwXmIjXj9pTgBOAflZ
	 A6B/yXpwx106CII9VzQNQ6qYw0M4eeC/NLzuQuObKNgwT4yc8ulmdxIf7n2Xd0jrd5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675112;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QM50OniaR8o4Eu1kLMclrrbI7Gj6A+dtLejuq/3Zj0w=;
	b=RNhPEYzSvwNFNKB1Jjqded5qRZHGYtLp6RkhPTANgmT6/orA9RNlT0hZITaqNSpSrr4J
	 zOSTTTgqVpKroRPg7iYp4u2O+JkF0IC6ndR5tGuh3q4El0vD/jwUPRd4d/6S6eZFK9yPI
	 yzXDvUgZUFlMiRGIhcRiNBYvxUgW6w6JAOxl2g/ha4MyEfKLwFlxSNInEaybPWqhsXoR3
	 BibEG1WD2KJ6C+ao2lBRDfJGHs+kmxZEdlPVbeb0FiAuNcj+1gSlnJUAqXmGveywt/GBx
	 8P7Cmoh0GtDfUxyWiSREnLqTd9yzKojEvajuAJI17BTvKt9CebCiWIZj/ey/MjYnadQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tex4y+xA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8243F606A329;
	Tue,  3 Nov 2026 03:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tex4y+xA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793675112;
	b=japJHn7lPO/IbPDdmspmXjrn0EWkdLlJL8RqntO549G6uBnOhXruDKBzwG4wc48ukfGC
	 KuBf+0vyLbqziHbli0E6poFd1cSUds0YZeP2GzarckvrtU5uuAjntqQlIogwDIyYiaERH
	 TlUceTDwdtt6Kj7u7/GIqcA2HwY3eQ0ntWPUEms92kO858jFKwHscyL/kPZ+whbtDob/z
	 nexwr3Ah1u7tkkFhGxWYgfSrLozA2htN0Tsh6IQmVm5Rrn0lvFTsf6EdIvyPosmsCyJXl
	 HXxzMmi0j00U/SDEZXYpxZeQ4JOd6ps7l46Eh45vCEvmlMhemGDJQpS5hmvDS6bDVLA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793675112;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QM50OniaR8o4Eu1kLMclrrbI7Gj6A+dtLejuq/3Zj0w=;
	b=Y3rStk3WVAYotoDBIOC2lZxNgr6KdSipzou/dMhvXAnLLvxNsm4MFORhlPzk8rPuTVFY
	 eK0liiDLABwafBHu8ApnCdLjUTDc6/p/qm+qLv7PkKZdfwurMuxn2Qls1NlHTUNbT6exu
	 gLE3MrF1/QrBkvQpfq+b80pArF3Mor0vDC67GiOKWW3gRK2vhvJMt6bpPrrO4hGR7jgH1
	 u77Jv2WM51K/hQWJiWGhKHTjUlRK3z3ZFOr0XvH16CeRBaIxwESevxr/Y2TFQvFoyGgbg
	 3f5c7I4tYyBaH0kBdHUITE95rs8JgYjnZKiCC7zJFquI0NI1JHlp2Udg5vK2QLBhiuw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 235571F00A02;
	Tue,  3 Nov 2026 03:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793675112;
	bh=QM50OniaR8o4Eu1kLMclrrbI7Gj6A+dtLejuq/3Zj0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Tex4y+xAmqogX31ObwTkOd4BB0tGx45zQmgYICymsszDVJ7vST/HR2BXxkF+cm7W+
	 w/gLt1FMhF5w8U00/qP1r80tDR88cOjB0u/qon6XxWXTu265zZ7r9ajB8XjhutqWrf
	 IHX7IuGZT+vOLlyzHvNBD3JvQckchHGM1B44HXgtFLS5MV8iGR0tJR74p9qltLxrrs
	 dVm+QnItka6y6UxKhiZR5UeMDxMLV5rs0gWxf/VNAl1LvuSK9f0gVIv9y6O6Akq+Cf
	 t2IH7OTDKiPGYLiMiTBhCbWpRyfslQ/vFfhy1GP96xIhlDXSzhNRySAbifB37awm8W
	 o31MCT3WAUKgA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9420F46770;
	Tue,  3 Nov 2026 03:05:10 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 03 Nov 2026 11:05:05 +0800
Subject: [PATCH v2 2/5] media: i2c: it6625: reject DV timings changes while
 streaming
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-upstream-it6625-dv-timings-fix-v2-2-127b879da6d3@ite.com.tw>
References: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
In-Reply-To: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793675109; l=1943;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=CK9wpK9WnhVPH9f9YKkPk4BReeAe5JrgiqvMPNRO0G0=;
 b=c82ohfoaJFOuPpgW9GAL/oG44awFpnvpJ05HWugTEwxcCu2u14bYoGGtHpsTurmD1b8pk/RJF
 HgYsVLSHw+9CqdzkxLzpyDFI/43lCwz73K83VEOxETFsSHPdgJLeXq4
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw
Content-Transfer-Encoding: 7bit

From: Hermes Wu <Hermes.wu@ite.com.tw>

S_DV_TIMINGS replaced the configured timings and the ACTIVE pad format
while the subdev was streaming, so the reported pad format no longer
matched the stream being produced. it6625_set_fmt() already refuses to
change the format while streaming.

Return -EBUSY in that case, as documented for VIDIOC_S_DV_TIMINGS. The
check runs with the active state locked, after the identical-timings
and validity checks, so setting the same timings again still succeeds
and invalid timings still get -ERANGE.

it6625_pad_s_dv_timings() passed on only -ERANGE from
it6625_update_timings_if_changed() and returned 0 for anything else,
which would have reported -EBUSY as success. Pass every error on.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 0d3bc83e4e865e55bb9940c7e958b85eedf9869a..a499b5e39acfbb1acaffc077d4f1fbdca3071a40 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -1483,6 +1483,8 @@ it6625_update_timings_if_changed(struct it6625 *it6625,
 						  it6625_get_timings_cap(it6625),
 						  NULL, NULL)) {
 			ret = -ERANGE;
+		} else if (v4l2_subdev_is_streaming(sd)) {
+			ret = -EBUSY;
 		} else {
 			it6625->timings = *timings;
 			it6625_fill_timings_format(&it6625->timings, fmt);
@@ -1588,8 +1590,9 @@ static int it6625_pad_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 		v4l2_print_dv_timings(sd->name, __func__, timings, false);
 
 	ret = it6625_update_timings_if_changed(it6625, timings);
-	if (ret == -ERANGE) {
-		v4l2_dbg(1, debug, sd, "%s: timings out of range", __func__);
+	if (ret < 0) {
+		v4l2_dbg(1, debug, sd, "%s: failed to set timings: %d",
+			 __func__, ret);
 		return ret;
 	}
 

-- 
2.34.1


