Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716410;
	b=NxfMX4YQZfPRtV4C55g687JAkp+m3DS4F9Nl55rC9KGOlQ5FhUWc7GERWmASSUA/qrZ7
	 XYmGntXS2YfbbuAw+0YZw0VDErSFhb+XGz8nxxvYlS7uHBYWGYpAlrBVtiG19vNay5loZ
	 JMRrh4gF8E3YUyaJWj7+DoXHCBz9NFVW7Wg16rJFkPlCCAikKOVFuHbudEnOdbR1rZwog
	 Ka11AHa7jQ/DN3z00L0TN+o4GasoEV7hVdJtn9N9kQqTmuYDJdesdZXXvTAQG8tUPRiZ2
	 kp5wCT10qcib9vxjJRBUV8uyMrhj7ov17MXAXv3B3+W/9goanLMsRnyf6edk0aZ/93A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tI+UwBYPAdWdAqb3dEv/Iv9MEi3mF5GYk2Iq/sV6Q+g=;
	b=Nf+fMkd7ljyYgu68jbBzzjOHvtNChXncbVQun/NKxW1DIaaOMiQyg12Ja1BBqvRsyb+f
	 FrSFpgPh+YtYvmXrwgusOy8oFwTeDe4/BLRtf70w4nEKVIKxRcDuLVc/98iZqvvz8ZdaH
	 XjUofjnTURbAMlaLFZutPlN3sw0mdrDPhKVBkCv93bcvMRZeCN32rJjlitzNm4x2ASIHR
	 /RXlOfXnsNnB/aI5Rw5wN/bmFnnAxw0BZKQFLtVQEPjnHgiqqAK93ZxwJ9Aw+5OYcxLDl
	 cchraPt0wBdyx1i5YZ+6X+D3I9p2cy5K8B8/c32T9xUmoaxqlTcS0DKk6qt+mpU5xBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMakKWWq;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BBF606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52BBF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMakKWWq
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso1185901a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716409; x=1794321209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tI+UwBYPAdWdAqb3dEv/Iv9MEi3mF5GYk2Iq/sV6Q+g=;
        b=OMakKWWq92Jd+LPrw2dMjUdTbbCAHgwKqsXYpnakA0v1IJIkLsk4HcA6AbC23W5evB
         tBOnUGm/ka/t1RUwhJg+BHoPaU+s00V6u3Fe1ySkT1SBqwNnxJyzcLx+qHUoRYu32qhP
         tXVZErMxSmBKIh3vGaM8ZQnRggivAf8MstgCX58MI2A/pAiHxCjpybxhMMRYYxvK5Mqk
         m4teoOc30twESU7y+jNP2M7ZEUioy8qxI+whMvVDc98MA50iAUcLcIsXt8dD5CtmR1Y6
         gRxgV4ApYBNEUqoUkpRJ0jyPFall9y1XOJZnbNjJs2eYgcoJ/SYs/A50n2jOFhvZOc4G
         CQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716409; x=1794321209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tI+UwBYPAdWdAqb3dEv/Iv9MEi3mF5GYk2Iq/sV6Q+g=;
        b=TtaftZw7EC/MvoNWV7oFiTLFS7juog+zpg5Up1F0qgZc62UpOdDp9kuc51oSjtx1GB
         rXng57+/3hFVxvzUmYygXdBiPiNweETYD63LP+/fi+H1fbEbCc6DUHR/8ofczwyaAbeD
         6C9davPveV/aqdw94GrLwGYz+54rEszWpb1FOr0Q850EyH3xLrHX3K7B11PBdNpNsS8U
         SMd176+0qyUXGJ4m9jAtZRxAEGJyySTtKb27IwfN87AwIrjQVpIRYR8J6qRRoElxh9su
         FTOiAElulNn2JEUSrb7JWtX++DJb69jI834Masa4gvCTGeqegyGpnIGEg0VKaIrEpg9j
         UEPQ==
X-Gm-Message-State: APuU4Z9DOqgwf0wgpvw79QcHtvCEy9j+wKkzu2LZnILsow2ibaZHWx2l
	LG5CeapEoYWhyaH5f1nsO0GLLl0M7qJPa6dJN1m8nxT3QobXBoWsVeJ/0TYvdScqwXyEsmUH
X-Gm-Gg: AYBFou1pLw1zZwldgE5+KzPOR79hwj6kVIW+hKbMEIA5d7gjnfBr8Ah751otqzSVwx2
	PfgF8ozEEeXGTmwCzfUdIg3h/mKv46UpVDU1/W8Ea6C8W6wxlPdGnkGGeJrsG06/Tbe0gp7dAbW
	Pf0g4pYTWlctGq5NZJLgm4VwyYRDF/a9i+c6KLeKOCRosneCfQqseYNf3xzIDqDnYwnItoxbdhB
	SjpfSdkxNxo4KXJSYr/THxTRPQ7n0/jo0GbgmgZXAK9ZA5itQp70KNASOcfWekgu4aMoTrIykSe
	h6PxcgI4zCksCs0CMSCOsTBwFC8ukuvyxUbXzJFgQxZ+9gWvA7uAWc9d/sozvwMbJCOCv1Tgf81
	Pk9qWkxUNuBXqXBN2XOfyVDFlS2LyS+f6bQTSUM3iqRxbMy9bq1X49sHMt616Sf214DYhWJI35g
	ZNxWm/Q3JpfgUSiT6TGlRFurt5Vc3qCiMxrZQstV6NOPQg9Y49hyQ02qkAZLk0ukfUSd9H3y7F1
	J4Tj0Uvk80ahDBVsaJpwopapdgvVYV5UzMCaFRwSMMFbKNHuxymyaihDebRzeLla3HD9tArAFDu
	S1RVhMuYDde3sjNVrTSZlnI/UMyTYnPkNtO1xHlCRIGOBfPso8FzaY2C0qS1ALOynISxxf94PFL
	Kb2XYkZUjH+n2lm0idtyg5N7cNXTebYOTd3eFj2GVEkF012Sne6SJW1q49/IEqwFxCw==
X-Received: by 2002:a17:90b:4c08:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3ae8957cc59mr11107986a91.9.1793716408508;
        Tue, 03 Nov 2026 06:33:28 -0800 (PST)
Received: from localhost (ec2-18-182-19-4.ap-northeast-1.compute.amazonaws.com. [18.182.19.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9b0ec5sm4698225a91.16.2026.11.03.06.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:33:27 -0800 (PST)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	stable@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>,
	Viktor Malik <vmalik@redhat.com>,
	linux-xfs@vger.kernel.org (open list:XFS FILESYSTEM)
Subject: [PATCH] xfs: fix inverted action for empty leaf block in xfs_dir2_leafn_toosmall
Date: Tue,  3 Nov 2026 22:32:58 +0800
Message-Id: <20261103143308.10870-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Jianyun Gao <jianyungao89@gmail.com>

When a directory/attribute leaf block becomes empty,
xfs_dir2_leafn_toosmall decides whether to delete it by calling
xfs_da3_path_shift to find a sibling.  rval is non-zero when no sibling
is found and zero when one is found.

The code currently sets *action = rval ? 2 : 0, which is backwards: it
tries to delete the block when no sibling exists (corrupting the tree
by self-merging) and keeps the empty block when a sibling is found.

The analogous xfs_da3_node_toosmall (xfs_da_btree.c) uses the correct
*action = retval ? 0 : 2, and the non-empty branch in the same function
uses *action = rval ? 0 : 1.  Flip the empty-block case to match.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---
 fs/xfs/libxfs/xfs_dir2_node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_dir2_node.c b/fs/xfs/libxfs/xfs_dir2_node.c
index 19cb536e53ef..55244d153f84 100644
--- a/fs/xfs/libxfs/xfs_dir2_node.c
+++ b/fs/xfs/libxfs/xfs_dir2_node.c
@@ -1546,7 +1546,7 @@ xfs_dir2_leafn_toosmall(
 			&rval);
 		if (error)
 			return error;
-		*action = rval ? 2 : 0;
+		*action = rval ? 0 : 2;
 		return 0;
 	}
 	/*
-- 
2.34.1

