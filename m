Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182069;
	b=QeoLGZoH6OGC3I3WBbQYW4Wbw/M3+1W5ImDtLtLHRfcNEQUR3c4LiWYPZ4qnh/vYkdDD
	 Q3EV7Nq2WFQXcU7wGCt49hwZhwwlz5UND02jBqnWxfjS2zva002lWRu9S8RMSxeYai26F
	 c5Bzj7Ept4uUibLWLx+7VxiUIXl4g6DpY1sVXjCqfhE3TtaXH/ymjSdp74cQTMubd+kVN
	 1f/2ASLGHc6R1XxKAuQZUliFJaiIDEfGDqZGvo+BPUFI3mUltyXExSn9Io/Nk79FCl++1
	 24zlKsoUiP75/AbIOzP7acvGfcpWqS/KpuqNxM4n8lBxGf5UmrzVLW8kgeP/zHJZN2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182069;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LRlQoYvznGxKaR6S5tzHrpDEO9Xei9jH7j2O0O51bpY=;
	b=L+zVGwNJqxgyOxj8Tp1RsvAUs/6p1FAQM3YNnjBN++bCfmQqBnIw6UZpGZRfqxI6Tv+0
	 V9nR72gjyxyZNWhPW0b8uuNgZNt1j0uLHcuXgx0LCqKJ1tyfNDh/68RuWwKwVLto4OMpk
	 zeJwU0VKl99GLraJk596KenxDfBx8N1LtM5v6ZrbODkxL0TapUNXuTQVLAwRfphqPrSmv
	 iZKGYmUYmfkbKTED5mLCzq9MCLN0SPlOTCT8fh+oBGcwqqGBPvu5Q1cWbMI8hDrIqqvua
	 4zeLKOMjlVYzlN4wH0CoRPjm1be9EWOF5Aam1pkYwu36Cm407FKTe8o5Wc/aRWbvKOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=d7dlUsXA;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E3606A33A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9E3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=d7dlUsXA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794182067; x=1794441267;
	bh=LRlQoYvznGxKaR6S5tzHrpDEO9Xei9jH7j2O0O51bpY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=d7dlUsXAOjDTklXOFLcKnRGhcH4fRtoZ8VpUSd8aeG35IfLK3Z9YQ/6Hntk6D4IoU
	 ePsPDCnPpbs5HBlEe8CdPBXCgyMeGKUz0Z3vkNuRnP44R8i9UWCC6je+tESZS8+G1U
	 Lpe8gnPuqTAqGsT0kWcM3DFF9n5VdnoQKgsnJpcwjmdQLyR5+LteIqgwNGV3m7vtOf
	 gn9OVHTnDRiQkOHmGVZ/QJNkq3vlxadkXD6DOVtUpcdnBytR/xPLrkchTmtS7V5lBw
	 CBLsaBhQjXBsBtIAjiBLSILcwArnzzPEQwohMkZddEvcgg4jSar7fKcPWFmdBSVhrV
	 3ybBkGTdZ0uxg==
Date: Sun, 08 Nov 2026 23:54:21 +0000
To: "anthony.l.nguyen@intel.com" <anthony.l.nguyen@intel.com>, "przemyslaw.kitszel@intel.com" <przemyslaw.kitszel@intel.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ice: bound field vector section count and base offset
Message-ID: <dSgoJeOcq27FGGEfV7i3OvTKHIbGYWsvCfu3SmthHIkzkoFdKa4al0bvTEn-nhlm-EnViuHMBWMoxqQO0PwAQKHhTQli6u6ohi5vJGh0cLQ=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: cdd4d3cda1576c642d507a172e48d28b5099204e
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

ice_sw_fv_handler() validates the field-vector entry index only
against the package-supplied count, and computes the profile offset
from a package-supplied base_offset:

    if (index >=3D le16_to_cpu(fv_section->count))
        return NULL;
    if (offset)
        *offset =3D le16_to_cpu(fv_section->base_offset) + index;
    return fv_section->fv + index;

Neither count nor base_offset is checked against the section size
or ICE_MAX_NUM_PROFILES, and every consumer trusts the result:
set_bit((u16)offset, bm) into a stack bitmap in ice_add_adv_recipe()
(reached with CAP_NET_ADMIN ethtool/tc rules),
bitmap_zero(hw->switch_info->prof_res_bm[off], ...) which indexes
past the prof_res_bm[ICE_MAX_NUM_PROFILES] array, and the field-vector
reads themselves which can walk past the section end. A count of 1
with base_offset 0xfff0 in the package file is enough to reach the
single-bit stack write.

The patch bounds base_offset + count to ICE_MAX_NUM_PROFILES, which
bounds every offset consumer. (A full fix should additionally check
the section size against count * sizeof(struct ice_fv), which needs
the section length plumbed into the handler; this note is included
for the maintainers.)

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), drivers/net/ethernet/intel/ice/ice_ddp.c:343=
-360 (ice_sw_fv_handler: only index >=3D count is checked; count and base_o=
ffset never validated), :799 (set_bit((u16)offset, bm) in ice_get_sw_prof_t=
ype - offset up to base_offset+count), :914 and :924 (bitmap_zero(hw->switc=
h_info->prof_res_bm[off], ...) with unbounded off; ice_type.h:780 declares =
prof_res_bm[ICE_MAX_NUM_PROFILES]), :846 (test_bit read), ice_flex_pipe.c:1=
995 (source memcpy), :2262-2264 (probe-time walk)
Longstanding parser; unchanged in the reviewed window.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/drivers/net/ethernet/intel/ice/ice_ddp.c b/drivers/net/etherne=
t/intel/ice/ice_ddp.c
index 3b2d9c4369..2d9c99eddc 100644
--- a/drivers/net/ethernet/intel/ice/ice_ddp.c
+++ b/drivers/net/ethernet/intel/ice/ice_ddp.c
@@ -349,6 +349,12 @@ static void *ice_sw_fv_handler(u32 sect_type, void *se=
ction, u32 index,
 =09=09return NULL;
 =09if (index >=3D le16_to_cpu(fv_section->count))
 =09=09return NULL;
+=09/* count and base_offset come from the package file and index the
+=09 * switch profile tables; bound them before use.
+=09 */
+=09if (le16_to_cpu(fv_section->base_offset) +
+=09    le16_to_cpu(fv_section->count) > ICE_MAX_NUM_PROFILES)
+=09=09return NULL;
 =09if (offset)
 =09=09/* "index" passed in to this function is relative to a given
 =09=09 * 4k block. To get to the true index into the field vector

