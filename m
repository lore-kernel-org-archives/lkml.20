Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794610986;
	b=lwGdiWi/oJtiZ0FcZ4b73V9ZpyYuhTZM89Y/KTSr0jhyXlIi1LXwYEpGhCATFMZVz+EY
	 odYphaSsmuhEOvtIuVBF2fOd/XoZFskHOlD9SkG4gij4oBjgNXOYh6Q6aF7wIqqhqNNeA
	 MCw9Akbyh+uQypWJtK8aO9UXL3OdKRJ6N4SS6U9YpUY1arNTwn6kQQ8XuS8JigqxZPYJU
	 NijoeI2abCWUyTQSR9CsO2ZoTFGeJHbsjYgT9JGo+uCNxn4LdQ09xoVxsibY5c7MbMrPE
	 MsIW2PWhDVFqMTODWOLIpCb/NWsGsU+rTonXUY59beFq96Ugv5cWSwsdRl1iMSot5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610986;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BYjggfmjKlGIW84B14hnVbDiPTvVGE5h9oEWsyq3OhA=;
	b=cmaRkE2P0+LBZIQ2VXjTbG35En7YBNhj4ueXGnDoRIVlWDXFpvE2JdK9Ar/VpJlNrdFI
	 buauGYWWKA5LTipUy/lvva7ZVmSw0+7awfgLJ/H+Rb+zOA3U45AKX8NWl4OMXrvSLGky8
	 hHaMN6zQQFtAppXQRxSI7Px+PEOGCXNMR3qDG87SjDUTZlmaQT3FhFp3eY5uOJziwEmvq
	 AcxHZCd22/AKJ4iCRBeNE4Fg5RMB8p8RMsEus63Ww/oxmCvGw+043FK3PzuOoZ0kt+VMl
	 XQr8wXdLRi0hIa84qP+PQkOQarm7+yMODapObY/f7pxWvNPyNZCW20GhfROXGjlEvtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jAldKYUa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49875606A8B4;
	Fri, 13 Nov 2026 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jAldKYUa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E031F000CA;
	Fri, 13 Nov 2026 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794610985;
	bh=BYjggfmjKlGIW84B14hnVbDiPTvVGE5h9oEWsyq3OhA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jAldKYUaS7GHU4f6IFTkZrIB0BQsJnm6E++ac3lkxEo5S92zCZyR8lZG1LE/+Zkfj
	 4LuCT+1azYCJd/kMKPpHKxMrUIP+v00ZL+7b0fmtmew7kc6NG/wc1pNhlqdzmc8Eq7
	 qAN4GsPgl99IxbijrUfoeGH1dUnCalb1knSgIkjw=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Fri, 13 Nov 2026 18:02:46 -0500
Subject: [PATCH v3 2/2] docs: submitting-patches: make LKML a list of last
 resort again
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
Message-Id: <20261113-get-maintainer-the-rest-fallback-v3-2-36ee5a3e8d13@linuxfoundation.org>
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
 Petr Pavlu <petr.pavlu@suse.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=nkdiQvp5Jj0ckO1qdttyQR3N/yfvZHdyh/6ZF5sauk4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLK+T1cpmR2cUczyKl1McuL+S+za01cGMS38WqMwaZX0r
 JPelzk+dJSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZiIxw5GhlmHVrSzLr9RuOCK
 W81UA02FjTHn4q9NKmraJ9FZ056h18PI8FwmKa6y+GjRCtYLItz7eYw2v9cUVlw+3Stxj+GH+7e
 2cQIA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

Commit 77167b966b7e ("docs: submitting-patches: clarify the role of
LKML") changed the documentation to say that all patches should be sent
to LKML by default, because get_maintainer.pl always suggested it.

Now that get_maintainer.pl only falls back to THE REST when no other
matching section provides a mailing list, update the documentation to
match: send patches to the subsystem-specific list, and use LKML only
when there isn't one.

Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
 Documentation/process/submitting-patches.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f271d7413f72..85ba046d66fb 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -239,9 +239,12 @@ patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
 maintainer for the subsystem you are working on, Andrew Morton
 (akpm@linux-foundation.org) serves as a maintainer of last resort.
 
-linux-kernel@vger.kernel.org should be used by default for all patches, but the
-volume on that list has caused a number of developers to tune it out.  Please
-do not spam unrelated lists and unrelated people, though.
+You should also normally choose at least one mailing list to receive a copy of
+your patch set.  Look in the MAINTAINERS file for a subsystem-specific list;
+your patch will probably get more attention there.
+linux-kernel@vger.kernel.org functions as a list of last resort for patches
+that do not have a subsystem-specific list.  Please do not spam unrelated lists
+and unrelated people, though.
 
 Many kernel-related lists are hosted at kernel.org; you can find a list
 of them at https://subspace.kernel.org.  There are kernel-related lists

-- 
2.56.1

