Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216529;
	b=GhEKTi56ptSGztFQsZQSfzDIUnuuxVOhFcC/rWHACVxuYSNBQrIj4lqfUUcNczS9H71y
	 HvD0VmC5ju/93rdrykRq02y8xNx8MTkFwDmk+uGy0/APYClqPe54ilHKZkbfH+oKTDhLN
	 X5+UR8WyWrclYVGAyIVWKCD6nQ2l8Ux+tkRbDsiB45lo+un2V+1RC0HLAHvlQMS7XyVpD
	 NgMe5es69joWaMadeuUhgRYt3jYzUrETsxx/xLmLySt1v3qYBRaOsLrDJhYU78lR234ja
	 a0S+wLC4SdSZa24MKT4eqe2zZyAcnlkDFkuYoWqnpnpcmPYTefksgSTW1L1qVD3YA/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216529;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=kRtc15qACQrrhw6q52HMAITrObBQ/cUkcNo8EQGxqHg=;
	b=v/NEvpzfaCcwojLM24lXG35gxKiz/9QU0mjdLYixGPy2t5g6HlF+De1pnKh72USbanCp
	 DahwN2f8sgqGtKel4DGSpVzrORx7ItfuhVQliYAB/cPr2WjCKkL+Qwc1Ux/cP3SgVuZwr
	 Yw1hyOk0C1HzhOEg8oLdmiKHd6CEoEC4AG2Iz0rsPjKdj2WW2T5Ymhg2N7k6u7qR5+sKp
	 gOedIrs+yOQToBwy2O2akUkCDRWzBjElAiiltCRyWxBHpQGBJ9Z3GVJxoNmaF667cTat1
	 v8uMUBCfzhd18V5bq77jN5rfhfLBcz8uw+I490UC6mKO63k19BJ5vOyCdlqtFOQp84Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=HtrrHqwh;
	arc=none smtp.remote-ip=91.218.175.93
Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE31D606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE31D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=HtrrHqwh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uDFZNqqcMaViNcFunC37Xsqwa4JQfAtgVKe7KDouB+E=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794216526; v=1; x=1794821326;
 b=HtrrHqwhk9RhH52hCN6Wtf8VqNsDiEtLk5wCQvtWXtKpn4mDE61X0Oi+yjj3bz8Ea9PaZ0gJ
 DRM6KaCZHFmSYmvaF605Wn2TFESFZ+pDiNay+uTYdjW/NrOrVxUxo+EDKzjEpBcnnhE2DxwcoGO
 xawdFVRNSEYG4UXLDrIqzxYm+qZAS4b9RcoWAyr+nzsG7+IxDVLJDHTM4MK9CeUYyAhfyqfmuRh
 KMoO9MGaD6SubNIiRKKX+7m9yMx6WWw5NHtuuI/nO8mt5s9KznT3nsHUmYeXz8Nh0wq9R82aROb
 YbhknW2WDLgMePfaof2YvCC3mZ4ZVcv06n8NTbx0lT7Ig==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a8d3082c63f33330;
	Mon, 09 Nov 2026 09:28:45 +0000
X-Mizu-Trace-ID: a8d3082c63f33330
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Subject: [PATCH v3 0/2] docs/zh_CN: update maintainer/configure-git.rst
Date: Mon, 09 Nov 2026 17:28:29 +0800
Message-Id: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/3WNQQ7CIBQFr2JYi6FUCLjyHsYF0A/FBRho0abp3
 S11oTFxOcmbeTPKkDxkdNrNKEHx2cewQrvfIdOr4AD7bmVECeVE0BabGKx3YwLs/IC54AoUkdo
 yjVbnnsD659a7XN+cR30DM9RIXfQ+DzFN22Fp6u5fuzS4wa3hDMAawwQ7P6ZRhUNMDtV2oR9bE
 vZrU0yw0o08dloYruW3vSzLCzh/4pj6AAAA
X-Change-ID: 20260823-configure-git-686aea09bf5b
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

Update the translation of two files:

1) maintainer/configure-git.rst
2) maintainer/pull-requests.rst

I only update the first one in v1. However, I find a reference of
pull-requests.rst in configure-git.rst is in English, while we've had a
Chinese one. So, update both this time.

Note that there're warm tips from checkpatch,

checkpatch.pl: :6: WARNING: 'Link:' should be followed by a public http(s) link
checkpatch.pl: Documentation/translations/zh_CN/maintainer/pull-requests.rst:118: WARNING: Do not use whitespace before Signed-off-by:

.. which are caused by a 'Link:' in the commit message and a sample Sob
trailer.

---
Changes in v3:
- Put "update to commit section" at the end of commit message in both.
- Rebase to d48723711bae (Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux, 2026-11-06)
  Alex's docs-next HEAD now.
- Link to v2: https://patch.msgid.link/20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org

Changes in v2:
- Remove the SPDX identifier, see details and reasons in the thread of v1.
- Add a new translation.
- Link to v1: https://patch.msgid.link/20260823-configure-git-v1-1-3c65eefcc585@wyuan.org

To: Alex Shi <alexs@kernel.org>
To: Yanteng Si <si.yanteng@linux.dev>
To: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Weijie Yuan (2):
      docs/zh_CN: sync maintainer/configure-git with upstream
      docs/zh_CN: improve maintainer/pull-requests translation

 .../zh_CN/maintainer/configure-git.rst             |  48 ++------
 .../zh_CN/maintainer/pull-requests.rst             | 127 +++++++++++----------
 2 files changed, 77 insertions(+), 98 deletions(-)

Range-diff versus v2:

1:  d292fa654b82 ! 1:  a791cc884749 docs/zh_CN: sync maintainer/configure-git with upstream
    @@ Commit message
         adding Link trailers automatically with an applypatch-msg hook, because
         Link: trailers should only point to useful additional information.
     
    +    Also point the pull-request reference to the Chinese translation.
    +
         Update the translation through commit 944df7a31452
         ("docs: update the guidance for Link: tags").
     
    -    Also point the pull-request reference to the Chinese translation.
    -
         Signed-off-by: Weijie Yuan <wy@wyuan.org>
     
      ## Documentation/translations/zh_CN/maintainer/configure-git.rst ##
2:  9ed78fb91f42 ! 2:  2bec387ee1e3 docs/zh_CN: improve maintainer/pull-requests translation
    @@ Commit message
         After the last update to the Chinese translation, the English document
         removed the explicit section label, replaced the configure-git
         cross-reference with a direct path, and changed "tree for forever" to
    -    "tree forever".
    +    "tree forever". Remove the abandoned Chinese section label and point the
    +    configure-git reference to the Chinese translation. Some of the existing
    +    wording did not read very smoothly, so polish a few expressions and also
    +    correct some Git terminology.
     
         Update the translation through commit 3a1b9c4d8edb
         ("docs: Remove redundant word "for"").
     
    -    Remove the abandoned Chinese section label and point the configure-git
    -    reference to the Chinese translation.
    -
    -    Some of the existing wording did not read very smoothly, so polish a few
    -    expressions. And also correct some Git terminology.
    -
         Signed-off-by: Weijie Yuan <wy@wyuan.org>
    -    ---
    -    I did make quite a few changes to make the reading more fluent. However,
    -    to some extent, this might also be unnecessary. If you think there are
    -    too many, I will remove the less essential ones. Thanks.
     
      ## Documentation/translations/zh_CN/maintainer/pull-requests.rst ##
     @@

---
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
change-id: 20260823-configure-git-686aea09bf5b

