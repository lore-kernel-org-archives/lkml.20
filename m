Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8E3AAF69
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854495; cv=none; b=LrmVC+kHVrMIvM7bhwYgVxoZeM6pp1+Fmj9zGM568/dwf/IvIEF4X4CHjgG7aJpewHGW2Vq3Jhiko1szXHiMAdnjNJhFV2/wYBPF6wz/elRFC3Ga++VEg6ZRL4A+zzwk2GSqGBy228q/mg40TqJCBSsy3TbuLnTVm1ltCt0PjX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854495; c=relaxed/simple;
	bh=kY5mHzv52Br0b7G2PSb1FefbbJw1TgOgY/VveBl3Qsc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q+paI+WkT46Cl+12PaSeKbZa/gHDUOXDnv8Ah9xQJxuGY1Wp7OONUrLycQdT4B+azSTFVZnYseDy0BbNBaovS6XeSJY2DkOfNpv9mouxLuiRgejT/anY4yeNxpGuvjwZPRxWpUJHQRHnCF1c0LJEOxCxF3RkzcALn3dl8qWcqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3Znfqj/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3Znfqj/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso41422765e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788854491; x=1789459291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kY5mHzv52Br0b7G2PSb1FefbbJw1TgOgY/VveBl3Qsc=;
        b=m3Znfqj/bwDpzfbnj4anIyUafd6vcZG2LrHjiioVNO534/X+Hj82izwzCZ0QuffINT
         dXhixNn7S2y5Sac+0rA6hugsNB3SMnrtoPlwhecNIxr+zVYnQbYeN738CXLNKa2DLRbA
         god1R5uPrX5Mcj9sXL5R2d2Jmn0athEV82vEOjHzeC/BbR6cYLurlH1Cxtg0kN/b5oSY
         Dgmjsss4aszvmK7b779Xefu3XaxLvqi3NUag4u8bE3sIWoelAqG2McQvMbmuTJ7HggSW
         WlPFKwWaFL8hh3jDJ9XkQ4O1c7FzM+l5Pp5jIo9GD/3PT4Cpds6H3nj8Jgp54j2FqScJ
         MAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854491; x=1789459291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kY5mHzv52Br0b7G2PSb1FefbbJw1TgOgY/VveBl3Qsc=;
        b=SxTi/CizygrR+MIZdWExtHG5cXBZRjk/6AOVeNst5t6w8a1yBbeYwhgB0jSLtO03gY
         xgM8dek/ZMgn4CJqM5WgIFgOQHKja9rYVW4aZmb6gdqP6HZHNKERd4JMiZEmGlNgyYlh
         rgeT4WgAlq/ObZiDsFA3J7gGnQo43SCuiR6cyhRGVLTxxB8GY4plafgBzutuMkZprcIg
         BqngmuBl1/BBmJtyw31uLzE5oYwZcG8kMIVrvMTVWt6gJacwLHROIl5r9oV6XVZmRDsB
         s8zxgy/BNswwPXZVw3YlYjqegY0GCg2QGEZGyzZDA1x3zbJ9UE3bL7gnifX8Z3LO6v3p
         NarA==
X-Forwarded-Encrypted: i=1; AKwUvBxCZPe2/BSL82zKHNSBBzUgnzFbXO6jPnd7EZySzdijbh9jO9qq/1NXcesiRvhEVKTX3r9I/8tnA07cPxs=@vger.kernel.org
X-Gm-Message-State: AFuF++kA2c7ofeQ/A0OHHtWKLP4MNXSk21WT/ywRLo+mXfnUjKE5Ac3m
	ZjK+z4Dc4742+SwYeN1530ZOtBY9ZGlSL727/3khnixLmNrlKYlDShyR
X-Gm-Gg: AYBFou1GHnrlJ3zbcNOD5gC24slYGzTNStP38DMHfn2z1j3a/z5vFDik809kqge4QG7
	4kbbZQXe3Wjc2ccFKazix/x/v8ES/EQK6eT6f3VryTlavuOJu0zU7u6F2EX2ITLRKixznULu2i6
	M5VPuUVjdf9LJQO0za2+WJG0XncQR9F28C6rh4LatKQWNVlLZsFguR5cISs6KQZwihrO/Ezg0Ix
	zUeLCTii6z8uVHpAKTCVpMgPSEMCHiqFyC4eDBN1XUMMda/xt30yut2NNlrhoM/dDw4JXcOr5Y7
	BlTRozNA9g8/2g7vslwkdvV2guoq/NKBU2cu61gr9k6FaWSKqRNT2tNanAQ/Y2vO0sX36yhZOEc
	qhZrz50BYdiprv7N9ZEhfmIRjmHmYoeqOIGBqaC4u6ozGIYGBQssx9x2rtkq/JxEpaXFro2mNW6
	LoMFKliuDXlN5QW0APvOp6VG80iuEJQzuuvyiGmj9XZCD7DGDlhz0bIltC/f+zSnr3pZRdq76eK
	J+pmsG4SNZ4u+LH5mE6AC6T+6UZpsvo7fsEKfbmKH6hcWeNb/uklKBzg3KgxU3zeViH+2RRfD7t
X-Received: by 2002:a05:600c:4693:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49d00399d19mr187306625e9.3.1788854489959;
        Tue, 08 Sep 2026 01:01:29 -0700 (PDT)
Received: from MYL150-3871.localdomain (57.11.28.93.rev.sfr.net. [93.28.11.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm344218455e9.11.2026.09.08.01.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:01:29 -0700 (PDT)
From: Nicolas Thibert <nithibert@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: btusb: fix NXP IW610 composite device handling
Date: Tue,  8 Sep 2026 10:01:08 +0200
Message-Id: <20260908080108.1260799-1-nithibert@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhlIE5YUCBJVzYxMCBtb2R1bGUgZXhwb3NlcyBpdHNlbGYgYXMgYSBjb21wb3NpdGUgVVNCIGRl
dmljZQooMDQ3MTowMjE1KSB3aXRoIHRocmVlIGludGVyZmFjZXM6IHR3byByZWFsIEJsdWV0b290
aCBIQ0kgaW50ZXJmYWNlcwooY2xhc3MgMHhlMCkgYW5kIG9uZSB2ZW5kb3Itc3BlY2lmaWMgV2lG
aSBpbnRlcmZhY2UgKGNsYXNzIDB4ZmYpIHVzZWQKYnkgbXdpZmlleC1ueHAuCgpUaGUgY29tcG9z
aXRlIGRldmljZSdzIHdob2xlIFVTQiBkZXNjcmlwdG9yIHJlcG9ydHMgY2xhc3MgMHhlMC8wMS8w
MQooQmx1ZXRvb3RoKSwgc28gYnR1c2JfdGFibGUncyBnZW5lcmljIFVTQl9ERVZJQ0VfSU5GTygw
eGUwLCAweDAxLCAweDAxKQplbnRyeSBtYXRjaGVzIGV2ZXJ5IGludGVyZmFjZSwgbm90IGp1c3Qg
dGhlIHR3byByZWFsIEhDSSBvbmVzIC0tIGJ0dXNiCmVuZHMgdXAgYmluZGluZyB0aGUgV2lGaSBp
bnRlcmZhY2UgdG9vLCBhbmQgbXdpZmlleC1ueHAgbmV2ZXIgZ2V0cyBpdC4KCkZpeDoKMS4gSW4g
YnR1c2JfdGFibGUgKHRoZSB0YWJsZSB0aGUgVVNCIGNvcmUgYWN0dWFsbHkgbWF0Y2hlcyBhZ2Fp
bnN0KSwKICAgZXhwbGljaXRseSBpZ25vcmUgdGhlIFdpRmkgaW50ZXJmYWNlIHZpYSBCVFVTQl9J
R05PUkUsIGFoZWFkIG9mIHRoZQogICBnZW5lcmljIGVudHJ5LgoyLiBJbiBxdWlya3NfdGFibGUs
IHNjb3BlIHRoZSBleGlzdGluZyBCVFVTQl9NQVJWRUxMIGVudHJ5IHRvIHRoZSBCVAogICBpbnRl
cmZhY2UgY2xhc3MgaW5zdGVhZCBvZiBtYXRjaGluZyB0aGUgd2hvbGUgZGV2aWNlIGJ5IFZJRC9Q
SUQKICAgKGhhcm1sZXNzIGVpdGhlciB3YXkgc2luY2UgcXVpcmtzX3RhYmxlIGlzbid0IGNvbnN1
bHRlZCBmb3IgaW5pdGlhbAogICBiaW5kaW5nLCBidXQga2VlcCBpdCBjb3JyZWN0KS4KCk5vdCB1
cHN0cmVhbSBhbnl3aGVyZTogY2hlY2tlZCBOWFAncyBvd24gaS5NWCBrZXJuZWwgZm9yawoobnhw
LWlteC9saW51eC1pbXgpLCBubyBJVzYxMCByZWZlcmVuY2VzIGluIGJ0dXNiLmMgb24gYW55IGJy
YW5jaCAtLQp0aGVpciByZWZlcmVuY2UgZGVzaWducyB3aXJlIHRoaXMgY2hpcCBkaWZmZXJlbnRs
eSAoV2lGaSBvdmVyIFNESU8KcGVyIHRoZWlyIHJlbGVhc2Ugbm90ZXMpLCBzbyB0aGV5IG5ldmVy
IGhpdCB0aGlzLgoKU2lnbmVkLW9mZi1ieTogTmljb2xhcyBUaGliZXJ0IDxuaXRoaWJlcnRAZ21h
aWwuY29tPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpBc3Npc3RlZC1ieTogTExNIChDbGF1
ZGUgU29ubmV0IDUsIEFudGhyb3BpYykKLS0tCiBkcml2ZXJzL2JsdWV0b290aC9idHVzYi5jIHwg
MjIgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KykKCi0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMKKysrIGIvZHJpdmVycy9ibHVldG9v
dGgvYnR1c2IuYwpAQCAtNzEsNiArNzEsMTUgQEAgc3RhdGljIHN0cnVjdCB1c2JfZHJpdmVyIGJ0
dXNiX2RyaXZlcjsKICNkZWZpbmUgQlRVU0JfQlJPS0VOX0VYVF9TQ0FOCQlCSVQoMjkpCiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCBidHVzYl90YWJsZVtdID0geworCS8qCisJ
ICogTlhQIElXNjEwICgwNDcxOjAyMTUpOiB0aGUgY29tcG9zaXRlIGRldmljZSByZXBvcnRzIEJs
dWV0b290aAorCSAqIGNsYXNzIGF0IHRoZSB3aG9sZS1kZXZpY2UgbGV2ZWwsIHNvIHRoZSBnZW5l
cmljIGVudHJ5IGJlbG93CisJICogd291bGQgYWxzbyBtYXRjaCB0aGlzIFdpRmkgdmVuZG9yIGlu
dGVyZmFjZS4gSWdub3JlIGl0IGhlcmUKKwkgKiBmaXJzdCBzbyBtd2lmaWV4LW54cCBjYW4gYmlu
ZCBpdCBpbnN0ZWFkLgorCSAqLworCXsgVVNCX0RFVklDRV9BTkRfSU5URVJGQUNFX0lORk8oMHgw
NDcxLCAweDAyMTUsIDB4ZmYsIDB4ZmYsIDB4ZmYpLAorCSAgLmRyaXZlcl9pbmZvID0gQlRVU0Jf
SUdOT1JFIH0sCisKIAkvKiBHZW5lcmljIEJsdWV0b290aCBVU0IgZGV2aWNlICovCiAJeyBVU0Jf
REVWSUNFX0lORk8oMHhlMCwgMHgwMSwgMHgwMSkgfSwKIApAQCAtNDc3LDYgKzQ4NiwxNCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgcXVpcmtzCiAJeyBVU0JfREVWSUNFKDB4
MTI4NiwgMHgyMDQ2KSwgLmRyaXZlcl9pbmZvID0gQlRVU0JfTUFSVkVMTCB9LAogCXsgVVNCX0RF
VklDRSgweDEyODYsIDB4MjA0ZSksIC5kcml2ZXJfaW5mbyA9IEJUVVNCX01BUlZFTEwgfSwKIAor
CS8qCisJICogTlhQIElXNjEwIEJUIGludGVyZmFjZXMgKE1hcnZlbGwtbGluZWFnZSBzaWxpY29u
LCBzYW1lIHF1aXJrIGFzCisJICogdGhlIDB4MTI4NiBlbnRyaWVzIGFib3ZlKS4gU2NvcGVkIHRv
IHRoZSBCVCBpbnRlcmZhY2UgY2xhc3MsCisJICogbm90IGp1c3QgVklEL1BJRCAtLSBzZWUgdGhl
IGJ0dXNiX3RhYmxlIGVudHJ5IGFib3ZlLgorCSAqLworCXsgVVNCX0RFVklDRV9BTkRfSU5URVJG
QUNFX0lORk8oMHgwNDcxLCAweDAyMTUsIDB4ZTAsIDB4MDEsIDB4MDEpLAorCSAgLmRyaXZlcl9p
bmZvID0gQlRVU0JfTUFSVkVMTCB9LAorCiAJLyogSW50ZWwgQmx1ZXRvb3RoIGRldmljZXMgKi8K
IAl7IFVTQl9ERVZJQ0UoMHg4MDg3LCAweDAwMjUpLCAuZHJpdmVyX2luZm8gPSBCVFVTQl9JTlRF
TF9DT01CSU5FRCB9LAogCXsgVVNCX0RFVklDRSgweDgwODcsIDB4MDAyNiksIC5kcml2ZXJfaW5m
byA9IEJUVVNCX0lOVEVMX0NPTUJJTkVEIH0sCi0tCjIuMzQuMQo=
