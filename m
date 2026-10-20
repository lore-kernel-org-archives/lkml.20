Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510561;
	b=wxv/qB+bKY2hFzWJ366KiO7ZjQpG/uol02A7y6+amwzZGQHn5UChkMs52QpIIIpv3kF0
	 uk3ie/4YCI9ABF19uZQBETIil9mVDlGINdxylA6hgmFCwuWnKPwd96jJoGRMC45Cd1aLv
	 sHr9CVUZ60KBJyhoSZTU5CMfQP4QvtVEYgwM990FUKDVVdcLik2yI0xZy1QMi/pb5dx2f
	 yd+4p8o5WUxs4EZb8HWVCxeOTaSMUZhWaqD9lX38FFk11OKx3abGqSJ/QUUFi/MzYdvnc
	 Ot79DH1IKNnWQsi9fldkTBEOFv6zPDFBnGONJ7MZXyeBpXnML0NGgDUcudAdVsxc8qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510561;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2AOV4pm7AorK9lt6gESTmGdhPU7UdYywGjmZagY/gEA=;
	b=Qb/rRsKkXO2u7qG++T1UYO6HpmmV40aWG1ILBOfqGchTWAguGAAYhTDTpS0kwZcDsPiG
	 IWu7kdSAzXL9p3PRYgY4UcJR0ZqMtiZ/5RnNtWNGYrVzrbJ5sJQUXvZQhTeDshgkPkJfz
	 EdaYMtFkxujzThaNQsYsRi79F2AR4yWlB+8i/K+ib/uX9rEU0lO/4lu37Y4SgTvKp/noW
	 NLOpQNyqJsSLf5uQeMz7oMNO0ttXR/izZS0nd43BCjUfo0uGSYDAu6/aOLrzraXPIq9u6
	 uJhijX5n+RLj5DLgM9G2qP5N2eojVDhzrdj+0IbUlQiTpNONUL3D6CHG54mBdzT2+7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="tyme/uX6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ADB606A325;
	Tue, 20 Oct 2026 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tyme/uX6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B581F000C6;
	Tue, 20 Oct 2026 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792510561;
	bh=2AOV4pm7AorK9lt6gESTmGdhPU7UdYywGjmZagY/gEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=tyme/uX67Pysyrv5HRg8SP5n8ZbkBF4sI+8siU5md05/VXQgf3CoWtlNJauGhG4O1
	 djVoUO4eIG2ye6RwcXbXlvj5ShX2ejufZC/NI9EqWnG0jbmEobpwCcf7GcZ+QSsshy
	 gLrUF79k9DKEsWhwLuBs2WIEJIqMcEdvrI+Fm6ck=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Tue, 20 Oct 2026 11:35:25 -0400
Subject: [PATCH v2 1/2] get_maintainer: only use THE REST as a fallback
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-get-maintainer-the-rest-fallback-v2-1-162aea473488@linuxfoundation.org>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
To: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, users@kernel.org, 
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-39d60
X-Developer-Signature: v=1; a=openpgp-sha256; l=2728;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=RRdnJx+BDUoR52UzSs0lemaFlVDUvp7fE9lNFpJn1Ec=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKud4UKc0S4HNi7NLLRomCO259svSbThetvGr5SlfVVq
 tx4Zsv5jlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABNhP8zI0OuUF9icyeiw4aFT
 OZ/D2saCgrWvBCyiV86ssrh1SGDzf0aG72a8on9WJD2b4xXzdbr2K1E5T78lBtc0MlbGLJKYW/i
 bBQA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

THE REST matches every file in the tree via "F: *" and "F: */", so
get_maintainer.pl currently adds linux-kernel@vger.kernel.org to every
patch, regardless of whether the touched files already belong to a
subsystem with its own mailing list.

Only add THE REST for a file when no other matching section provides a
mailing list that get_maintainer.pl would actually output. Lists marked
"subscribers-only" are omitted unless --s is given, and lists marked
"moderated" are omitted with --no-moderated, so such lists don't count
as a destination in those cases. Files that match no section, or only
sections without such a list, still fall back to THE REST, so every
patch keeps reaching at least one known-public mailing list.

Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
 scripts/get_maintainer.pl | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 16b80a700d4a..265245e568c6 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -959,6 +959,15 @@ sub get_maintainers {
 	    $tvi = $end + 1;
 	}
 
+	# THE REST matches every file, so only fall back to it when no
+	# other matching section provides a mailing list for this file
+	# that we would actually output with the current options.
+	my ($the_rest) = grep { get_section_name($_) eq "THE REST" } keys %hash;
+	if (defined($the_rest) &&
+	    grep { $_ != $the_rest && section_has_list($_) } keys %hash) {
+	    delete $hash{$the_rest};
+	}
+
 	foreach my $line (sort {$hash{$b} <=> $hash{$a}} keys %hash) {
 	    add_categories($line, "");
 	    if ($sections) {
@@ -1295,6 +1304,40 @@ sub find_ending_index {
     return $index;
 }
 
+sub get_section_name {
+    my ($index) = @_;
+
+    return $typevalue[find_starting_index($index)];
+}
+
+sub section_has_list {
+    my ($index) = @_;
+
+    my $start = find_starting_index($index);
+    my $end = find_ending_index($index);
+    for (my $i = $start; $i < $end; $i++) {
+	next if ($typevalue[$i] !~ m/^L:\s*(.*)/);
+	my $list_additional = "";
+	if ($1 =~ m/[^\s]+\s+(.*)$/) {
+	    $list_additional = $1;
+	}
+	return 1 if (list_is_selected($list_additional));
+    }
+    return 0;
+}
+
+# Must match the list selection in add_categories()
+sub list_is_selected {
+    my ($list_additional) = @_;
+
+    if ($list_additional =~ m/subscribers-only/) {
+	return $email_subscriber_list;
+    } elsif ($list_additional =~ m/moderated/) {
+	return $email_list && $email_moderated_list;
+    }
+    return $email_list;
+}
+
 sub get_subsystem_name {
     my ($index) = @_;
 

-- 
2.55.0

