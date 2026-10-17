Received: from outbound.st.icloud.com (st-2003a-snip4-11.eps.apple.com [57.103.77.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460CD4CF490
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792280620; cv=none; b=dD1VW+gGDBsl9qXNRsmVUuWdJIz+n+CVlpfLZUcf+1VXplzVnoFRY/IHdN3ko/tIAopb0aZOtroQi6FeNH3TXNOb8D+36PEhvNpYDlET6AGW4sJ632Fzyi5UtsgMu4VJADrcfSyJkaR/0cj6Oei4Y6ZJJvmQul+IdRcaQltumw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792280620; c=relaxed/simple;
	bh=3FqVr5SFCy2jOtzcFXx3p22yMPkTZnNRynDjOT862uM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CfExQN5yCrOLd3ZZbWnKJddTAPr9i63KFrperHpAj01i8O2dmc9vkLH2eQNw03N9t/8i3KLit1nvlpydYx6GCB1A/4Bci3L5nXwDFcg+wXlKhIdF6UHLubO37grPdDFK6v7msCI5lqb/iDiSwF9iNL1eQOMIAxDBG53k/saJwtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tali.vision; spf=pass smtp.mailfrom=tali.vision; dkim=pass (2048-bit key) header.d=tali.vision header.i=@tali.vision header.b=Fxfaau+g; arc=none smtp.client-ip=57.103.77.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tali.vision
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tali.vision
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tali.vision header.i=@tali.vision header.b="Fxfaau+g"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-10 (Postfix) with ESMTPS id 6DD1518000A0;
	Sat, 17 Oct 2026 23:43:35 +0000 (UTC)
X-ICL-RepId: 01a14c3f-d9c3-7d47-88aa-39c828078bf6
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhJAUMFWgFeCE0BQwBaEhVdRUcJWitGEVURHRteGFsfV1hVCQofUxxQVkUERAJdHhkKUFAGWRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVkYRVREdG14YWx9XWF4EU1YOQglKBVwHWgVCCkwAXwFFB0EKSAFABkZGFFQ4RwxbAhwGUAtaAllVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tali.vision; s=sig1; t=1792280618; x=1823816618; bh=3js7H1EKcitj+j6xf6ZoP+PGqkUlWvlOhINJrtsKDfo=; h=From:To:Subject:Date:Message-Id:MIME-Version:x-icloud-hme; b=Fxfaau+gLvO4pi4lZLupMVyXt2TQO9F+c0z6i21jRPhb7J1hNLqkYECqt0ZoMq5y5I5atkXicTWVXU/hIdSMUZouDBuWbQI5F81HrYf7VBdUIfboIfiG56khHzvpUkvBkN0tG2RYVc6jRqqZEhfPiwbBm1Gu1YGjn4HK1JHIR3s8IhsqDe4aj4CfIlmHLhMC6TLcJw7GppjWy4UGDAOL1/6eMOAHbrQ4AJrzPB8ipnSQvpTAYeU4tzMUhx8SV36kxWvpUX742mxDyUdy+juSZETPVJqT9a2aq+ug2zfFJ2bafOczccJ50M4YUAcxDBHdvd8b4HG4PqMlJgO+d1FUfA==
mail-alias-created-date: 1792277757822
Received: from tali.vision (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-10 (Postfix) with ESMTPSA id 51F531800109;
	Sat, 17 Oct 2026 23:43:31 +0000 (UTC)
From: Tali Vision <tdm@tali.vision>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Cc: Tali Vision <tdm@tali.vision>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] x86/mm/doc: Restore M TB notation as favoured over EB
Date: Sun, 18 Oct 2026 10:43:26 +1100
Message-Id: <20261017234326.51302-1-tdm@tali.vision>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=FIQWBuos c=1 sm=1 tr=0 ts=6ad40828
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=-nWcxsdtE8JYjLTbZX8A:9
X-Proofpoint-GUID: mc9dDr9UNN5dSgD1Ucbx6ERSRLn9joWH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA5NCBTYWx0ZWRfXxZh3syhHvHGb
 k8jVCseBLLZNXl1nX3mtwZL017KBovkN779PAcm8mNlwMLW7tTNXEKdIoZFTfO98DpUSU+5StFH
 Cl91eKeEniJWNWE5VUGMnu1+hOg0J/0D0ENJu8UKa9SN5HQGhd0S5X6okODfn3mmDbt7fBZ/T8A
 ist84lc0747ja4KbYeKwWKR+bUXvbapuTcPTp2fq4MqJQfdfmIYJdkLdIPZ1osKbjxTKEs7YYL2
 AfRxITzhVdEjYx/1cmZ/Cv5RuIN+NanjYU/uz0tRe5V2Pu9CRtht5AS1P0/WdKdNxv4EeBhUmIT
 OSBgq3Jynda+g4IYsQhzJ9/9tRgvpE155ARFf7RL/2ToJKQ//+eSsjdet6/FFs=
X-Proofpoint-ORIG-GUID: mc9dDr9UNN5dSgD1Ucbx6ERSRLn9joWH
X-JNJ: AAAAAAABP+Hy+sHW4lAUV+gcoXrW2K7XMm9P+9qnI7nvQrBg6kuRR1uL1C4Vw9A10Y8ZGaLrOLvfk6qOzjyKVYcNSJN4LyX6JXrd3e1QuQU6R7pLLxEWvJB23rklIKZPViqEExFL19Y2uMyzjkPJ20pIVd8uQchtZQuG6Ww6HrsY/XsGO+l/lldQJa67cNQpeBnSfH8cLO5RTVWrcHqcWOeGJI4v1GXLgZ3nHVTbfHF5jIsDdjdNmkFA9f2bONtJ7GEz76UaLbiwyQgnXJsU0T2PESORFi1bAE1bKLgFC1qLw7oqwmqWrQM2DRKUkjoHmxjZPvefwU86VfLBdule9OXFSIl4xXmTud2s3WMq3CnJQ6xS2yMuCm2zOfVso730sUYxuPRSm/LReSSR0/U4YWFmjcYI1RwTMYH4MCBgploUSqUEd49Iq2i7V8zOPzmwjhiIguNlzxjpMv269GLviMHFWS10ijRpGWHw6xbp6RcqMwFmGibgRnm/+jh6OnbkHETi5NNvnAPXVWcRm3n8hx5pySfi8sOxtcKKlweAh8Jb3CY0BHiod2Xa8lL14wXCyRHPd2u3hTsy1LB8h9oE3wbuQ2BZJLfJZXhTdaiQr89TygOznriy6UdjuXOTLQ+Pazmhn5GQaY+A5cSGBaxo5xwDQ8+Yjs2jM+ipGy9Rh8fQYJ6Zzb5FRhl/X97dbETucBK0FhESaWeRjugbG2IqiP1DLO92cd+FFxaKY4ouKJDObSuBTo6uHK0f2z3LRIRSUORcuhJ/7SW3Q2LIXRW69RAm9iQBEbNMa9x1Irt8wAPTLgWMtqrCV9IFp3Cf/zUuvHADOE9R1lmc9KnS32f6z86r8o3SplWNcerndkyuh01Ajc3G8KSWUC5fMDjbO5V6dXXsYMyIhudkDPL0kRawIaFNeC+i2MpnuXwQZxTMvJY81uKq3LhEXRoqHoXl8H2lWTHIpH330rRCrF2v+4axYbUS5d1mZh0
 rIhpxLzhXqXW/Kiz/eKhsplv5ESt8FMJ8aOs6nwsT97ciBO0M9spN9pj2aaUbJ0FvB91to0jB1enWoeg4MmHrej1CFPuswSjNsaz0nHWABWZXpSEOoRTlhDSegu17SoGfsEcuKg5LbTkj6tNG3zFIhxSu1/b4z1YHzju2SfJMkvL5FibI8Xe5K8VefCG6lbq7IywXyWSQnh3ZjqY9/vZ5NG+fO0EIONvfFSXdRCEJ6lz5iw/PdB5aekPZsedIuLc=

mm.rst currently contains a note about why the "16M TB" notation is
favoured over "16 EB" notation. This notation is absent from the memory
map as it was replaced by two "8 EB" sections, distinguishing between a
'user' and 'kernel' range in the 16 EB non-canonical memory hole.

Restore the notation introduced in commit 32b89760ddf4 ("x86/mm/doc:
Enhance the x86-64 virtual memory layout descriptions") and overwritten
in commit 035c5e2143f3 ("x86/mm/doc: Add missing details in virtual
memory layout"). Correct note about notation to use integer 8 instead of
integer 16.

Signed-off-by: Tali Vision <tdm@tali.vision>
---
 Documentation/arch/x86/x86_64/mm.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x86/x86_64/mm.rst
index a6cf05d51bd8..66afcc2e595f 100644
--- a/Documentation/arch/x86/x86_64/mm.rst
+++ b/Documentation/arch/x86/x86_64/mm.rst
@@ -19,8 +19,8 @@ Complete virtual memory map with 4-level page tables
    Note that as we get closer to the top of the address space, the notation changes
    from TB to GB and then MB/KB.
 
- - "16M TB" might look weird at first sight, but it's an easier way to visualize size
-   notation than "16 EB", which few will recognize at first sight as 16 exabytes.
+ - "8M TB" might look weird at first sight, but it's an easier way to visualize size
+   notation than "8 EB", which few will recognize at first sight as 8 exabytes.
    It also shows it nicely how incredibly large 64-bit address space is.
 
 ::
@@ -33,8 +33,8 @@ Complete virtual memory map with 4-level page tables
    00007ffffffff000 | ~128    TB | 00007fffffffffff |    4 kB | ... guard hole
   __________________|____________|__________________|_________|___________________________________________________________
                     |            |                  |         |
-   0000800000000000 | +128    TB | 7fffffffffffffff |   ~8 EB | ... huge, almost 63 bits wide hole of non-canonical
-                    |            |                  |         |     virtual memory addresses up to the -8 EB
+   0000800000000000 | +128    TB | 7fffffffffffffff |  ~8M TB | ... huge, almost 63 bits wide hole of non-canonical
+                    |            |                  |         |     virtual memory addresses up to the -8M TB
                     |            |                  |         |     starting offset of kernel mappings.
                     |            |                  |         |
                     |            |                  |         | LAM relaxes canonicallity check allowing to create aliases
@@ -44,7 +44,7 @@ Complete virtual memory map with 4-level page tables
                                                               | Kernel-space virtual memory, shared between all processes:
   __________________|____________|__________________|_________|___________________________________________________________
                     |            |                  |         |
-   8000000000000000 |   -8    EB | ffff7fffffffffff |   ~8 EB | ... huge, almost 63 bits wide hole of non-canonical
+   8000000000000000 |  -8M    TB | ffff7fffffffffff |  ~8M TB | ... huge, almost 63 bits wide hole of non-canonical
                     |            |                  |         |     virtual memory addresses up to the -128 TB
                     |            |                  |         |     starting offset of kernel mappings.
                     |            |                  |         |
@@ -104,8 +104,8 @@ Complete virtual memory map with 5-level page tables
    00fffffffffff000 |  ~64    PB | 00ffffffffffffff |    4 kB | ... guard hole
   __________________|____________|__________________|_________|___________________________________________________________
                     |            |                  |         |
-   0100000000000000 |  +64    PB | 7fffffffffffffff |   ~8 EB | ... huge, almost 63 bits wide hole of non-canonical
-                    |            |                  |         |     virtual memory addresses up to the -8EB TB
+   0100000000000000 |  +64    PB | 7fffffffffffffff |  ~8M TB | ... huge, almost 63 bits wide hole of non-canonical
+                    |            |                  |         |     virtual memory addresses up to the -8M TB
                     |            |                  |         |     starting offset of kernel mappings.
                     |            |                  |         |
                     |            |                  |         | LAM relaxes canonicallity check allowing to create aliases
@@ -114,7 +114,7 @@ Complete virtual memory map with 5-level page tables
                                                               |
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
-   8000000000000000 |   -8    EB | feffffffffffffff |   ~8 EB | ... huge, almost 63 bits wide hole of non-canonical
+   8000000000000000 |  -8M    TB | feffffffffffffff |  ~8M TB | ... huge, almost 63 bits wide hole of non-canonical
                     |            |                  |         |     virtual memory addresses up to the -64 PB
                     |            |                  |         |     starting offset of kernel mappings.
                     |            |                  |         |
-- 
2.39.5 (Apple Git-154)

