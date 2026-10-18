Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1E93D75D7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318358; cv=none; b=ZvIj9X7tyWJu5wiBGUrPSJ3RZN6gRuUHXJx+wkQh3xj0z437VRSyTKsBwZCDo/YOxTxoYlsU1R5iDp/G5fn19heVUy2xwBz9k1NkJkr0eJLkOytqqFZ9WNvJXbM9Gb0WP7iV/g0e8hhtahamuWSIRSW/BB0LoinJW64T7sjLTxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318358; c=relaxed/simple;
	bh=vYij15bCwlFcLFRf/ENZgrFgL1x2lTA/ql4e8grew8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a3Pm9BWs8gwXTsPIDzGYpKK856DQqHBzkmILsfHBdBkF6gSpm8hpkUu25bXBBhsNPiGoyChk36ZDCdXujBrASb+TyuqlP7PfHVPECucNUnciFJEDbTNAQicj3c8dC+tmGH86++M8iicmLRrcEgdIC3VCfqeM8G7GmpgyxyQZzyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw3SeibA; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw3SeibA"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so3094876eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792318355; x=1792923155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=djGSWMOqw6nAnZwCAbuBdUV5LRPyHSJU7HJCLAv77/Q=;
        b=kw3SeibA4HzDszafNh6NaILFO0+YKyUo8xA4FZVqA9Z0I65KFkUue2X2+n6VP8Ck4h
         Ha3xhsgjLpCTsEdnxbVks0dmmaYQmm1SFwQANWNtMj08Y0kKWzrzVp6/lLZzpMUiOXaq
         qu6OQf/CRuG4hbBGw2bxq0j8LU7ljJlnz7jimEnVKFlfI6QZvEaubvdLKjn6s+Cw5GvQ
         ScAKy78ayNLkAAj1QGWwZ0jWNuI+L5FpZp1JNDPG4mW7dHiWfvQ6AX7D5wnz7Z6VNZ8H
         zmNDTrrvjJ12JF/jHISwLXb8GLfUSILPtSaYsqCAhG7sevsqxY6pvWRI3ICjvtz+DaHV
         lJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318355; x=1792923155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djGSWMOqw6nAnZwCAbuBdUV5LRPyHSJU7HJCLAv77/Q=;
        b=hlQbl2zk9o3MQEvDYmZ8rGhGois3lvh0zw12Mu69lIic19NrbE5gwUZdUcoIxB8u/6
         RnSbGd6LOqNsxdbi8AO4QEhuNqnModuVjmKW2tBRQWy7eLT3DVrMLrC91ngsXRGodoe6
         x1FXsOj1hYK+89PBJmolX4I5rsv32C7hhzemKuOcu2Z4GIVhhkQ9NfltaffDinfFbJQX
         HG/amDVOuFPTlEOTNjGzJQSswlFQXo0g/L2YUWfpmYApcam239wnxS14o7Cle4ecf/hV
         GdmgFoOX/Vb4v8gRN/49qsSOBMSVEfEK8YlspN/UbyoMz/lrejM9NinXtomSoDHMPUik
         A2fg==
X-Gm-Message-State: AFq9FYKeXC9AZACkPr4OLwLVQsy+d71ape7s7VNLo1CtNftlnYE1ijYh
	6Y5aGzZ6r/h4Xqtf0uLnVJECIX3/O9hnRGdezXV9o57IlfYn2o9+VXPdusZrPjGF
X-Gm-Gg: AYBFou2imj1iYGDqWMyoRPxn6VUEvO74o5ooa8h95b2twfl3X+MPNxzG1gRJrpWNhxV
	nrjiPBt32zZZ1Cap2udcv0k6iB7C1d01UjCEcixcc6amLOE87Bn/cncwydvft1mnMBqhCu+MbAk
	9fiVPCRV2URiangn1KBmLF+beUiKZmmcNV6IKywk3uEz48SZgrtMv5LMGwkksImsOcSqsv7VS8d
	AaYOqiFnhBisb03yqXFOF15IyFF6iLUfNl2om2P5Mnms6D/ERsThccUUpg81zhD79IcYENlDHzS
	6St+c1yl18MYxf8UrF2g3QfX+Jki4frbyGUVxj7/q1cv1lEc6VjTBRkqAAvhUPAf4IKy5Z+tCm/
	nf507wDrORsMY5smUcmahgbqy+vkpaFu2cF7UIEFjvlL/hcUiQ16fNU7t0wSMLBinhTtYKBZ5xW
	4QPuSV9mvOY2SSU8wFpqQSAubS2ZsctSUSRK1IDqdSDKndJNQ9X3yVtPhrNrOCnTFs6eEp9rhAp
	uI+UmEG/QldZT0vH80zxVcsY7TTAHYMsU8frJBxuA==
X-Received: by 2002:a05:7022:b050:b0:184:329d:eced with SMTP id a92af1059eb24-1851267070bmr6875108c88.25.1792318354631;
        Sun, 18 Oct 2026 03:12:34 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm17967876c88.14.2026.10.18.03.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:12:34 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 0/4] scripts: convert four small Perl utilities to Python
Date: Sun, 18 Oct 2026 07:12:23 -0300
Message-ID: <20261018101227.7680-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts four small Perl utilities in scripts/ to
Python 3, following the precedent of kernel-doc.py, spdxcheck.py,
checkkconfigsymbols.py, and bpf_doc.py.

Each conversion is a faithful 1:1 port: same CLI, same output,
same behavior (including pre-existing bugs, documented in the
individual commit messages). All use only the Python standard
library.

The four scripts are:
  - bootgraph.pl          -> bootgraph.py          (SVG boot timeline)
  - checkincludes.pl      -> checkincludes.py      (duplicate #include finder)
  - markup_oops.pl        -> markup_oops.py        (oops annotation)
  - profile2linkerlist.pl -> profile2linkerlist.py (readprofile to linker list)

Tested by running the Perl and Python versions side by side on
the same input; output is byte-for-byte identical for the three
scripts that have verifiable output (bootgraph, checkincludes,
profile2linkerlist). markup_oops requires a live oops and
matching vmlinux to fully test.

Breno Rodrigues Alves (4):
  scripts: convert bootgraph.pl to Python
  scripts: convert checkincludes.pl to Python
  scripts: convert markup_oops.pl to Python
  scripts: convert profile2linkerlist.pl to Python

-- 
2.43.0
