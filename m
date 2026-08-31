Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EBD3E009F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170199; cv=none; b=jgbJBlZsnzAOVAZYtr9yqQsvW2b5wa8whGeiZ8vvoPXLzlxpvetC3F8i8jwhsULVOLDxXiELc7eCQSPfnzfYcSsH2mNnMJD4FiHG8jIpWi0rilDh7EjMV/940QWNehBXqyYstY7FOedxYJPqHF/m4gEaZPuoOWzlkKODlHnqCsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170199; c=relaxed/simple;
	bh=SRWa//q/Oe0KcyG0sl+HSO7sri60e1FARKH6twymneI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ao/BV5A94TehAnHtsbTW5afkjBglRCbupSa5bsldsbHEhWSQJjoRQtBpVVqEtfn7AtjLNTcn4P+9uW40D00naodWlh9ED+crJI5GlIMTiRzdQrjssnM9G3t/LsCwUsOAVb1F61V6mmqwjd15gWxr4wX9e2EaDG/SVdB3lxfvbFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3b45f97aa52211f19a56ed5b684f684d-20260831
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED, SA_LOWREP
	SA_EXISTED, SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8b34814f-4def-431b-a6f6-898aeccd1277,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:8b34814f-4def-431b-a6f6-898aeccd1277,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:117e14e26037127cd46d9232f119a2d1,BulkI
	D:260831172420DK3T68F2,BulkQuantity:1,SF:19|38|66|72|78|102|127|865|898,TC
	:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3b45f97aa52211f19a56ed5b684f684d-20260831
X-User: guojian@kylinos.cn
Received: from ym-pc.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <guojian@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 652173866; Mon, 31 Aug 2026 17:56:26 +0800
From: Jian Guo <guojian@kylinos.cn>
To: apw@canonical.com,
	joe@perches.com
Cc: linux-kernel@vger.kernel.org,
	Jian Guo <guojian@kylinos.cn>
Subject: [PATCH] scripts/checkpatch: fix false positives from learned types and modifiers
Date: Mon, 31 Aug 2026 17:56:03 +0800
Message-ID: <20260831095603.266724-1-guojian@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch incrementally learns unknown identifiers as types/modifiers
while scanning a patch: possible() pushes them into @typeListFile and
@modifierListFile and rebuilds the $Type/$Modifier regexes via
build_types().  This heuristic misfires on identifier-heavy code such
as BPF programs declaring kconfig/ksym externs, producing two families
of false positives.

1) POINTER_LOCATION: when an identifier is a strict prefix of a later
identifier (e.g. CONFIG_X86 followed by CONFIG_X86_64), the learned
prefix is treated as a type modifier and the remainder of the
identifier is captured as a "modifier" between the type and the
declared name:

	extern void a32_elf_hwcap __ksym;
	extern void a32_elf_hwcap2 __ksym;
	extern bool CONFIG_X86 __kconfig __weak;
	extern bool CONFIG_X86_64 __kconfig __weak;

	ERROR: "foo2 bar" should be "foo 2 bar"
	ERROR: "foo_64 bar" should be "foo _64 bar"

The match splits the identifier mid-word: both sides of the split are
word characters, which can never happen for a genuine pointer location
problem (the type is always followed by whitespace or a '*').  Add a
(?!\w) after $NonptrType in both POINTER_LOCATION regexes to reject
mid-identifier splits.

2) SPACING: annotate_values() unconditionally marks a learned modifier
as type 'T'.  When the token is actually used as a value, e.g.

	if (CONFIG_MEMCG_KMEM && CONFIG_ZSWAP) {

the following '&&' is classified as unary ('&&U', meant for the GNU
'&&label' label-address extension) and checkpatch reports:

	ERROR: space prohibited after that '&&' (ctx:WxW)

A real type modifier is never followed directly by a binary operator,
so require a plausible follower (identifier, '*', '(', ',', ';', ')',
'[' or end of line), mirroring the DECLARE branch.  Anything else now
falls through to the IDENT branch and the token is treated as a value,
which also fixes the same misclassification for binary '-' and friends.

Verified that the false positives above are gone, that genuine
unary-operator errors (!, ~, -, *, &, &&label) and genuine
POINTER_LOCATION errors are still reported, and that the output on 100
recent commits is unchanged.

Signed-off-by: Jian Guo <guojian@kylinos.cn>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7a846a3ea127..1b3e409269e2 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2141,7 +2141,7 @@ sub annotate_values {
 			print "DECLARE($1)\n" if ($dbg_values > 1);
 			$type = 'T';
 
-		} elsif ($cur =~ /^($Modifier)\s*/) {
+		} elsif ($cur =~ /^($Modifier)\s*(?=$Ident|[\*\(,;)\[]|\s*$)/) {
 			print "MODIFIER($1)\n" if ($dbg_values > 1);
 			$type = 'T';
 
@@ -4862,7 +4862,7 @@ sub process {
 
 # * goes on variable not on type
 		# (char*[ const])
-		while ($line =~ m{(\($NonptrType(\s*(?:$Modifier\b\s*|\*\s*)+)\))}g) {
+		while ($line =~ m{(\($NonptrType(?!\w)(\s*(?:$Modifier\b\s*|\*\s*)+)\))}g) {
 			#print "AA<$1>\n";
 			my ($ident, $from, $to) = ($1, $2, $2);
 
@@ -4887,7 +4887,7 @@ sub process {
 				}
 			}
 		}
-		while ($line =~ m{(\b$NonptrType(\s*(?:$Modifier\b\s*|\*\s*)+)($Ident))}g) {
+		while ($line =~ m{(\b$NonptrType(?!\w)(\s*(?:$Modifier\b\s*|\*\s*)+)($Ident))}g) {
 			#print "BB<$1>\n";
 			my ($match, $from, $to, $ident) = ($1, $2, $2, $3);
 
-- 
2.50.1 (Apple Git-155)

