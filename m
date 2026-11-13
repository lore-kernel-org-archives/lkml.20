Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794610984;
	b=IHDAmn/aJInTZA4tjdvfMNJR/Z/IOLkrgkuEUooncvlt+PjkEH50ISt1ADlxwxIPsKhL
	 QocqbZgLb5F0xcYpDeTWIhmCtsdlSEBu5u22MzqqiK0R826RSf/IG0+PPPiwo1j1k452L
	 C1+Cl6Y1ehAZEqslymOnAmZ0U//7zFxk3/xPXNXWhnjvWEapWGvuqJtVS7t3kyvXvFVc2
	 Zb2ok/vDLC+ZoAea/WwgPteF+2Hy9jhDmB0/ruXeANfOkHpB/ZnkGlYU1yOt35TuvP+fg
	 DeUoDBWYz38Vc/kJD5qB0wfj3aqFRM1b723gP99IGc/jarhixVg+vArk7rQy4+txIHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610984;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=F5GiVNDj8PMOJ8qcm80vZi0zSNICIqhFFh55SjoLjks=;
	b=ab6fr4tYIZGVl74rHFsx5f3I3SIjcD6uHuI3ixplSOmk70oY4uG/ewgppu2/EqNfzQIa
	 8NSRYAMpr3mW/TcH8zXRZRZlJgAkw512233hwxTAGE/sj3n6D4KliI9DP7KJvtN6aDrsH
	 33BPhsF2LdqCU/e/+vIXBglfRBlOy8AZ0VoqUnUs0cEKOmcIR008PNO+gqQP2Ax2qts8v
	 CjKKHZUzsMDQhFlZG4ahzxy88M4tl59KVPJYO03DxZyv2PjTV2gklNyFOWsB1BgX8dRLy
	 jJvqnhFIOhGsilHyg5NcbHZLjmGvmneN5DhOu+yBi29XOx4XFOM6fCMI8tITd0lAvSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="L771atl/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC0D606A33D;
	Fri, 13 Nov 2026 23:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L771atl/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33DD1F000C8;
	Fri, 13 Nov 2026 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794610984;
	bh=F5GiVNDj8PMOJ8qcm80vZi0zSNICIqhFFh55SjoLjks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=L771atl/B4Pa1+DrtXZk2L3UsrdncS4w04Rr36XW3B+nELs3vYXMCCqJwYzTFNxcx
	 I1CAjzyfd4g0x/Cvo71u60KsQv9v/GtbxahciTQ2a/Gj+X2HE+fweVNE+xKhFu1KoE
	 xx6kC28y84iYjqUY/Mkp1gH1RuuwoLcJzkGyB9q8=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Fri, 13 Nov 2026 18:02:45 -0500
Subject: [PATCH v3 1/2] get_maintainer: only use THE REST as a fallback
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
Message-Id: <20261113-get-maintainer-the-rest-fallback-v3-1-36ee5a3e8d13@linuxfoundation.org>
References: <20261113-get-maintainer-the-rest-fallback-v3-0-36ee5a3e8d13@linuxfoundation.org>
In-Reply-To: <20261113-get-maintainer-the-rest-fallback-v3-0-36ee5a3e8d13@linuxfoundation.org>
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
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2728;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=oNM//TwuHLIFXC78rS0TnQDjQ3ngxzwc8RC0vmK14fI=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLK+T1d+kTel1rxJ9+3t47d7UxyPZguen+yx0tayrvN98
 96DV/8u7ShlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjCRCXsZfjIeP9n6WOeLXUmQ
 ladaafWKJ9Ji4gLsBwx9KnZyCu6XOMTIMK35whuWq6ffmNu+8rinekE2OPnf5b0b9tWZ740Pm/t
 kExMA
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
2.56.1

