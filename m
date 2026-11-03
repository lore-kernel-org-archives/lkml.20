Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703856;
	b=K6WViE0FCd66b1fVAsV3D1+e44xosOHvfGxx5yxtpdK3i2OMi59H3KyNL3ojHwcXYWzd
	 8psxdrnYln9CgRbHAowGmw2taGkeufbjwCIfHpUFbS2E/zBTqYQsAgRegyubZIMOvu4Mh
	 nIoDBwDv7W7yDSDCJckbPnaJqWvDrd9eue2k6Tqc/fwbwCtg2R873sNWttDkaWEZX8Pl6
	 ap6QN+VCpluNUr1/AIJ/G6Icma456melGe2HcONyUlW3mVGeOvfm3TYxpkpz+gFINaA4/
	 lwb96mZqZijApTBgAXfDBumeaZt6FCsAQNoWVpJzq6n/IaTTRoYOcfF9eL2OFFSiGAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703856;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=em0sl5f3cl7hm/dK9xuLVyHUX7w3KpTJOOXQ+Qvn1oc=;
	b=BJz1ZMIoMfMJcc14OGYPQ27OQbAJPHyPgo7tcNONwFsZADbzQJXk9G9m8L990oiS2NIb
	 s2IKsQDsY98AZxZTYLM6y9V7VYrYfJEUEE7XEqvgG4BVLOKXEnWUecLRAkA7UNGnNAHgd
	 nCNmhm08lfve/QqMF8pV1OJDdxh/PCEZ6z4aLC4ZTvpdaV+8AyXyn0uAgf7RGp28fMz7M
	 iGWNxSjBYVZ1gcUFzIqWBCujGA5YksGmLHMCMLnjeqnbxtFvO2L73Jtzq5COkqCett0Qr
	 pRNpj9P7vEzCXo6IF3xCF+19QkU11FJH4W//mVgQkBr54W9BpjY6m0lZHHZ9KgOAsNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=84.16.66.168
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63147606BA77
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63147606BA77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJm0s52jrzC4r;
	Tue,  3 Nov 2026 12:04:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793703853;
	bh=em0sl5f3cl7hm/dK9xuLVyHUX7w3KpTJOOXQ+Qvn1oc=;
	h=From:To:Cc:Subject:Date:From;
	b=gHVl20S3De8kRxBxcsHgpLh0PFkoIbwp/0MtJSDwHMQD4wIJUtm6qa4EpWD7VGMJu
	 Suzrh8G+5icVZI8mKULuXAKOmYqvmqf+qHvtw3hkRbn7QHh5uzmqM8G05kktZZPurl
	 8IBjIzMf6pe+fvoDQrheLAXkS4Aih5hVQ0K11BC0pJ4Lpk0UvAh2ElTTlisU4SgG97
	 l/kGInTTwGqMU/U9F7X6dOE7Ky8zVq3F+jw91rkNZT5Lr3ySCrlpD3m/rZgQwenst7
	 yVjVIhB5hWpO9BGYhlK1sW9EdTZMRlfFySZFVSKsVxuwTfgMSSqiHUFSFn/TIVZcUz
	 BjsA04GkPPYiQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJm0r5SbjzqGb;
	Tue,  3 Nov 2026 12:04:12 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOCJI-00EwZs-1E;
	Tue, 03 Nov 2026 12:04:12 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: [PATCH] kbuild: detect module name collisions between '-' and '_'
Date: Tue,  3 Nov 2026 12:04:11 +0100
Message-ID: <20261103110411.11698-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

Kbuild converts hyphens to underscores in KBUILD_MODNAME, and the module
loader treats both characters as equivalent. However, modules-check.sh
compares module basenames without normalization. Consequently, modules
named foo-bar.o and foo_bar.o pass the conflict check even though they
have the same effective module name.

Normalize basenames before checking for duplicates, and use awk to show
the original module paths in diagnostics. Preserve detection of exact
duplicates and leave distinct names unaffected.

Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/modules-check.sh | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index 4c8da90..3d12dc5 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -13,10 +13,19 @@ exit_code=0
 # Check uniqueness of module names
 check_same_name_modules()
 {
-	for m in $(sed 's:.*/::' "$1" | sort | uniq -d)
+	for m in $(sed 's:.*/::; s/-/_/g' "$1" | sort | uniq -d)
 	do
 		echo "error: the following would cause module name conflict:" >&2
-		sed -n "/\/$m/s:^\(.*\)\.o\$:  \1.ko:p" "$1" >&2
+		awk -v name="$m" '
+			{
+				basename = $0
+				sub(/^.*\//, "", basename)
+				gsub(/-/, "_", basename)
+				if (basename == name) {
+					sub(/\.o$/, ".ko")
+					print "  " $0
+				}
+			}' "$1" >&2
 		exit_code=1
 	done
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

