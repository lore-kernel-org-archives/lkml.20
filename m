Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181846;
	b=Hn7YeTi5O7FTswYJrurOIJf5EOBkYOy5HUsZOIuWMAD+b0bp5Yj9oxEQAniO1h2CbIb8
	 eXTsm62ALQeajVI0YCtGOMo33hvYwSalryyM5MLH/lX/LaYM6kAvQwxDfOwG3qWV0Y3wp
	 6B0qjm4fT+wm1bpEvsgyf45fP/fpmcc4S5o2AImRhsZ4PQ/tXpLB6IlPnkSGgcD0sCwf+
	 Ku8iAbAcVrkZg5a6DwkNYxNDhQkL6TtNO86naQzqbceepatFE6VrLO1Cks+RUXSsiYx6M
	 i/uqOBmFaskUQzrGEXT5KXszO4G/F2joALkrV5CD97ZINg83K+p959PiLpKSdP0R9OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181846;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=R/j8tCNpPpADFlgeEjVhmngVNj9+ECjprKtZgv/nZnM=;
	b=xZYmRNZUNxSmuX0JIr/GqPdgcW2+yxFHeZ+4tGDVGCIJeQnjWXPiIC+gOW1aEJOUXr5X
	 0aCR79U+jmNapGY9dxnRqBIM3gfgxKBrr6R82JkHLMAIs/OSJaWSgD3TbIjBdx+rxR09p
	 md/WNg4ltMiOi15ZYJ1KuIEsFI/oa6BtBrJ0pwQ5pjIt83OQR7ES4bDv7NmlYDA8u5cCw
	 OaeYPEa8j6iGtCm/aWfCrIF/bdkb05It9VyBEWGnFn5pNjmkVCqxhiBY9Fo11rHEcvsn2
	 H6RGGGlNZcI2ulTFEiIr15d9+WhZXrpq1UtXOL6IPiqtw5kbCZG9SWi6rEkqj8jGf9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=MpLEpnUd;
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2A1606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC2A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=MpLEpnUd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794181842; x=1794441042;
	bh=R/j8tCNpPpADFlgeEjVhmngVNj9+ECjprKtZgv/nZnM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MpLEpnUddGcdOFcCqyyDoI4YiXLoyG+mBWxjAHZt36FzFSZYIlb5i/EvhoECGCFki
	 sPj0Hx8e+iqs73KeAZDwDMIIB8ynZ5cK8ZsgNhL2XySRFvOSnIamVBm3wjFJURFhnQ
	 yWuO6YwaKsXDLQXLaTfTdRkI+HVO+tMZ+DDIw0IKyfM0oLg77olxjOoHgPHVVr5fqE
	 +ITB35Aaxdpw3FmlxMJzY1bdK7sx6lV5Z6SwBuABKXa6kKsd4mkfRuirIUJLfQsB4j
	 V8oqmtWkkJGIrSXoQ5eTeN7NhMCuMsvkI8wxW+rnsJ25yL0hjXqSLLFAfLQ+f4c0mo
	 HV0N3MaNLYtdA==
Date: Sun, 08 Nov 2026 23:50:38 +0000
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: octeon: check preamble strip lengths in cvm_oct_check_rcv_error()
Message-ID: <kuEkzsTutkDJaeT0z-PKW6_KdvgCr7XLwuBWbL9Wl4cD7t97cPIZiVMPUloKfLWUdsZeJBF5x_vuXl0OfwWnjEA6BMbcnYjjXkptwDtQhBg=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: aef59b36fd6a360be780c9316587c030e918c395
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

cvm_oct_check_rcv_error() strips a non-standard preamble from
received error frames by counting leading 0x55 bytes and subtracting
that count (plus the SFD/preamble bytes) from the 16-bit
work->word1.len field, without any lower bound:

    while (i < work->word1.len - 1) { ... }
    if (*ptr =3D=3D 0xd5) {
        work->packet_ptr.s.addr +=3D i + 1;
        work->word1.len -=3D i + 5;      /* can be -4 */
    } else if ((*ptr & 0xf) =3D=3D 0xd) {
        work->packet_ptr.s.addr +=3D i;
        work->word1.len -=3D i + 4;      /* can be -3 */
        for (i =3D 0; i < work->word1.len; i++) { ... }
    }

The walk allows i =3D len - 1, so the subtraction can underflow to
0xFFFC / 0xFFFD in the 16-bit field, and nothing revalidates the
length after the helper returns 0. An attacker on the segment can
force this by sending a frame that is almost entirely 0x55 preamble
ending in 0xd5 (or any byte with low nibble 0xd) with a bad FCS or
alignment error, on a port running with PRE_CHK off. The zero-copy
receive path then sets skb->len =3D 65532 over a small pool buffer
(skb_set_tail_pointer past skb->end), and the 0xd variant also runs
its nibble-shift loop for ~64K iterations past the buffer end - an
out-of-bounds read and write walk.

word1.len =3D=3D 0 additionally makes the walk condition
work->word1.len - 1 wrap in the u64 bitfield container, so the 0x55
scan itself runs away.

The patch drops the work entry when the subtraction would
underflow or the frame is too short to contain a preamble plus SFD,
following the existing drop convention in the same function.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), drivers/staging/octeon/ethernet-rx.c:99 (whi=
le (i < work->word1.len - 1) - len is u64:16, so len =3D=3D 0 wraps to ~64K=
), :106-110 (word1.len -=3D i + 5 with i up to len-1: underflow to 0xFFFC),=
 :113-122 (word1.len -=3D i + 4 then a nibble-shift loop over the underflow=
ed len: ~64K OOB read/write walk), :286-287 (skb->len =3D work->word1.len; =
skb_set_tail_pointer past skb->end), :294, :317
Longstanding code (OCTEON SDK heritage), unchanged in the reviewed window.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/=
ethernet-rx.c
index 5be43bbf6a..bb02bcbfbe 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -96,6 +96,12 @@ static inline int cvm_oct_check_rcv_error(struct cvmx_wq=
e *work)
 =09=09=09    cvmx_phys_to_ptr(work->packet_ptr.s.addr);
 =09=09=09int i =3D 0;
=20
+=09=09=09if (work->word1.len < 2) {
+=09=09=09=09printk_ratelimited("Port %d short frame, dropped\n",
+=09=09=09=09=09   port);
+=09=09=09=09cvm_oct_free_work(work);
+=09=09=09=09return 1;
+=09=09=09}
 =09=09=09while (i < work->word1.len - 1) {
 =09=09=09=09if (*ptr !=3D 0x55)
 =09=09=09=09=09break;
@@ -105,6 +111,12 @@ static inline int cvm_oct_check_rcv_error(struct cvmx_=
wqe *work)
=20
 =09=09=09if (*ptr =3D=3D 0xd5) {
 =09=09=09=09/* Port received 0xd5 preamble */
+=09=09=09=09if (work->word1.len < i + 5) {
+=09=09=09=09=09printk_ratelimited("Port %d malformed preamble, dropped\n",
+=09=09=09=09=09=09   port);
+=09=09=09=09=09cvm_oct_free_work(work);
+=09=09=09=09=09return 1;
+=09=09=09=09}
 =09=09=09=09work->packet_ptr.s.addr +=3D i + 1;
 =09=09=09=09work->word1.len -=3D i + 5;
 =09=09=09=09return 0;
@@ -112,6 +124,12 @@ static inline int cvm_oct_check_rcv_error(struct cvmx_=
wqe *work)
=20
 =09=09=09if ((*ptr & 0xf) =3D=3D 0xd) {
 =09=09=09=09/* Port received 0xd preamble */
+=09=09=09=09if (work->word1.len < i + 4) {
+=09=09=09=09=09printk_ratelimited("Port %d malformed preamble, dropped\n",
+=09=09=09=09=09=09   port);
+=09=09=09=09=09cvm_oct_free_work(work);
+=09=09=09=09=09return 1;
+=09=09=09=09}
 =09=09=09=09work->packet_ptr.s.addr +=3D i;
 =09=09=09=09work->word1.len -=3D i + 4;
 =09=09=09=09for (i =3D 0; i < work->word1.len; i++) {

