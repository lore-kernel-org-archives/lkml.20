Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D935E929;
	Fri,  2 Oct 2026 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921509; cv=pass; b=CiP2qx0RFM2GlYdpXSj4zYgruPlFGOS49Ym032SGPgHMttBfeZEHksmfGniH8LfDnn0NgTh6dDn0qKE9EKRF9APD0szlDONN0xu1uIwffpt/pHwyIDoOKW1+sFMVQ1QNZODzBhm8CmV+1Yc/bYsPfgzk8YLFjLQGa+JgZophxCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921509; c=relaxed/simple;
	bh=MxHBUWJk32rRNrQsHM/OpUyqNJkhbjCWwS3ZuSAbBsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B2UYSEcqjT9g4+kPumNA/Xdh0gIEkuU+HP2RqJ3Sa24DsfNeKy66b/1MuGSxIjz6nuoVT5gZtmca2sA3GQS5LDwMsv5w3imeHl24nCVJpoAQ7NsVEbhkQo4QT5l/B4Qsy4x21hzFoRFbPJhaKwxMaYnHz3dPXqdI8n5o1+lo5ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=ok37618/; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="ok37618/"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 070CB10B98DA3;
	Fri,  2 Oct 2026 15:02:06 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkIplF8-EjFP; Fri,  2 Oct 2026 15:02:02 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1790920922;
	b=gtZ+Cz8i5P9aVSsvNPtr7SlaoVJEZa2xBBe/wN1r/Takq4XJh8389LN3qrucgMgLG4sZ
	 OD56Op+wj//TUVW2GYopRiutCX0pglnUgaMQD+fTwNfql3DjrxNv2ImAyLkCZ6sG64zja
	 rEkdtxzw4UW2+JAPGyyyaCJWzTGIUhQKto=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1790920922;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fQAzUzGGZR5C0TZkJr47c+/haybbNZ80y+AO4puVSIM=;
	b=FFeNYQsCPm0dxf22Ke6MwHtQFgQDTGvnc/dRFGNTZBviC2zSs/uFQp+wJUmzaLD9meDZ
	 ygAIubPizERl+05nkO0MiKlSCFUfNaN6evhCg/t7FuD8v/abUKWsF8KGM3tWM+iPwOZBk
	 AT7v7YJYzo7hwgW5h5NIkHyq3kFJfoew5g=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 53C1710B98DA2; Fri,  2 Oct 2026 15:02:02 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 53C1710B98DA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1790920922;
	bh=fQAzUzGGZR5C0TZkJr47c+/haybbNZ80y+AO4puVSIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ok37618/9kCLugqhPfbZst9L06iQ0gIEctelVHXq0tw1j0LsQcqPEg/rgYes8jl1u
	 BxXZ6dBiS4RuFJox2c/qv4zejJ+oFx+7d+jryFl0mv9PDu8a7fpxvXYh35xEGB3ffN
	 XWxEt9Pk+mNgMD6PpTB8Z78reyNrO7cf7Fw1kLHU=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akiyks@gmail.com,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH v2 RESEND] docs/ja_JP: translate submitting-patches.rst (review and report tags)
Date: Fri,  2 Oct 2026 15:01:57 +0900
Message-ID: <20261002060157.223645-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260910011432.710551-1-weibu@redadmin.org>
References: <20260910011432.710551-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Translate the section describing Reported-by, Tested-by, Reviewed-by,
Suggested-by, and Fixes tags into Japanese.

This includes the Reviewer's Statement and the guidance on adding or
removing review and testing tags in subsequent patch versions.

Keep the Japanese submitting-patches documentation aligned with the
corresponding English section.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---

Changes in v2:

  - Use "=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2" consistently for "r=
eviewer".
  - Keep the Reviewer's Statement in English and add a Japanese
    tentative translation in a formal style.
  - Reword the Reported-by description as suggested.
  - Use a file-local reference for "=E5=A4=89=E6=9B=B4=E5=86=85=E5=AE=B9=E3=
=82=92=E8=A8=98=E8=BF=B0=E3=81=99=E3=82=8B".
  - Drop the duplicate tagging_people label.


 .../ja_JP/process/submitting-patches.rst      | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
index 797b70b97fa7..dfc5500f420d 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -573,3 +573,119 @@ Acked-by:=E3=80=81Cc:=E3=80=81Co-developed-by: =E3=82=
=92=E4=BD=BF=E7=94=A8=E3=81=99=E3=82=8B=E5=A0=B4=E5=90=88
     Signed-off-by: From Author <from@author.example.org>
     Co-developed-by: Submitting Co-Author <sub@coauthor.example.org>
     Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>
+
+
+Reported-by:=E3=80=81Tested-by:=E3=80=81Reviewed-by:=E3=80=81Suggested-by:=
=E3=80=81Fixes: =E3=81=AE=E4=BD=BF=E7=94=A8
+---------------------------------------------------------------------
+
+``Reported-by:`` =E3=82=BF=E3=82=B0=E3=81=AF=E3=80=81=E3=83=90=E3=82=B0=E3=
=82=92=E7=99=BA=E8=A6=8B=E3=81=97=E3=81=A6=E5=A0=B1=E5=91=8A=E3=81=97=E3=81=
=9F=E4=BA=BA=E3=81=AE=E5=8A=9F=E7=B8=BE=E3=82=92=E7=A4=BA=E3=81=99=E3=82=82=
=E3=81=AE=E3=81=A7=E3=81=82=E3=82=8A=E3=80=81
+=E4=BB=8A=E5=BE=8C=E3=82=82=E5=86=8D=E3=81=B3=E5=8D=94=E5=8A=9B=E3=81=97=
=E3=81=A6=E3=82=82=E3=82=89=E3=81=86=E3=81=8D=E3=81=A3=E3=81=8B=E3=81=91=E3=
=81=AB=E3=81=AA=E3=82=8B=E3=81=93=E3=81=A8=E3=81=8C=E6=9C=9F=E5=BE=85=E3=81=
=95=E3=82=8C=E3=81=BE=E3=81=99=E3=80=82=E3=81=93=E3=81=AE=E3=82=BF=E3=82=B0=
=E3=81=AF
+=E3=83=90=E3=82=B0=E3=82=92=E5=AF=BE=E8=B1=A1=E3=81=A8=E3=81=97=E3=81=A6=
=E3=81=84=E3=81=BE=E3=81=99=E3=80=82=E6=A9=9F=E8=83=BD=E8=BF=BD=E5=8A=A0=E3=
=81=AE=E8=A6=81=E6=9C=9B=E3=81=AB=E5=AF=BE=E3=81=99=E3=82=8B=E5=8A=9F=E7=B8=
=BE=E3=82=92=E7=A4=BA=E3=81=99=E3=81=9F=E3=82=81=E3=81=AB=E3=81=AF
+=E4=BD=BF=E7=94=A8=E3=81=97=E3=81=AA=E3=81=84=E3=81=A7=E3=81=8F=E3=81=A0=
=E3=81=95=E3=81=84=E3=80=82=E5=A0=B1=E5=91=8A=E3=81=8C Web =E4=B8=8A=E3=81=
=A7=E5=8F=82=E7=85=A7=E3=81=A7=E3=81=8D=E3=81=AA=E3=81=84=E5=A0=B4=E5=90=88=
=E3=82=92=E9=99=A4=E3=81=8D=E3=80=81
+``Reported-by:`` =E3=82=BF=E3=82=B0=E3=81=AE=E5=BE=8C=E3=81=AB=E3=81=AF=E3=
=80=81=E3=81=9D=E3=81=AE=E5=A0=B1=E5=91=8A=E3=82=92=E6=8C=87=E3=81=99 ``Clo=
ses:`` =E3=82=BF=E3=82=B0=E3=82=92
+=E4=BB=98=E3=81=91=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=
=E5=A0=B1=E5=91=8A=E3=81=95=E3=82=8C=E3=81=9F=E5=95=8F=E9=A1=8C=E3=81=AE=E4=
=B8=80=E9=83=A8=E3=81=A0=E3=81=91=E3=82=92=E4=BF=AE=E6=AD=A3=E3=81=99=E3=82=
=8B=E3=83=91=E3=83=83=E3=83=81=E3=81=AE=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81
+``Closes:`` =E3=81=AE=E4=BB=A3=E3=82=8F=E3=82=8A=E3=81=AB ``Link:`` =E3=82=
=BF=E3=82=B0=E3=82=92=E4=BD=BF=E7=94=A8=E3=81=A7=E3=81=8D=E3=81=BE=E3=81=99=
=E3=80=82=E3=81=AA=E3=81=8A=E3=80=81
+``Reported-by:`` =E3=81=AF=E3=80=81=E5=90=8D=E5=89=8D=E3=82=92=E8=A8=98=E8=
=BC=89=E3=81=95=E3=82=8C=E3=82=8B=E6=9C=AC=E4=BA=BA=E3=81=AE=E6=98=8E=E7=A4=
=BA=E7=9A=84=E3=81=AA=E8=A8=B1=E5=8F=AF=E3=81=AA=E3=81=97=E3=81=AB
+=E4=BD=BF=E7=94=A8=E3=81=A7=E3=81=8D=E3=82=8B=E5=8F=AF=E8=83=BD=E6=80=A7=
=E3=81=8C=E3=81=82=E3=82=8B=E4=B8=89=E3=81=A4=E3=81=AE=E3=82=BF=E3=82=B0=E3=
=81=AE=E3=81=86=E3=81=A1=E3=81=AE=E4=B8=80=E3=81=A4=E3=81=A7=E3=81=99=E3=80=
=82=E8=A9=B3=E7=B4=B0=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=81=AF=E3=80=81
+=E5=BE=8C=E8=BF=B0=E3=81=AE=E3=80=8C=E4=BA=BA=E3=82=92=E3=82=BF=E3=82=B0=
=E4=BB=98=E3=81=91=E3=81=99=E3=82=8B=E3=81=AB=E3=81=AF=E8=A8=B1=E5=8F=AF=E3=
=81=8C=E5=BF=85=E8=A6=81=E3=80=8D=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=
=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+``Tested-by:`` =E3=82=BF=E3=82=B0=E3=81=AF=E3=80=81=E8=A8=98=E8=BC=89=E3=
=81=95=E3=82=8C=E3=81=9F=E4=BA=BA=E3=81=8C=EF=BC=88=E4=BD=95=E3=82=89=E3=81=
=8B=E3=81=AE=E7=92=B0=E5=A2=83=E3=81=A7=EF=BC=89=E3=83=91=E3=83=83=E3=83=81=
=E3=82=92
+=E6=AD=A3=E5=B8=B8=E3=81=AB=E3=83=86=E3=82=B9=E3=83=88=E3=81=97=E3=81=9F=
=E3=81=93=E3=81=A8=E3=82=92=E7=A4=BA=E3=81=97=E3=81=BE=E3=81=99=E3=80=82=E3=
=81=93=E3=81=AE=E3=82=BF=E3=82=B0=E3=81=AF=E3=80=81=E4=BD=95=E3=82=89=E3=81=
=8B=E3=81=AE=E3=83=86=E3=82=B9=E3=83=88=E3=81=8C
+=E5=AE=9F=E6=96=BD=E3=81=95=E3=82=8C=E3=81=9F=E3=81=93=E3=81=A8=E3=82=92=
=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=83=BC=E3=81=AB=E7=9F=A5=E3=82=89=E3=
=81=9B=E3=80=81=E5=B0=86=E6=9D=A5=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=81=
=A7=E3=83=86=E3=82=B9=E3=82=BF=E3=83=BC=E3=82=92
+=E6=8E=A2=E3=81=99=E6=89=8B=E6=AE=B5=E3=82=92=E6=8F=90=E4=BE=9B=E3=81=99=
=E3=82=8B=E3=81=A8=E3=81=A8=E3=82=82=E3=81=AB=E3=80=81=E3=83=86=E3=82=B9=E3=
=82=BF=E3=83=BC=E3=81=AE=E5=8A=9F=E7=B8=BE=E3=82=92=E8=A8=98=E9=8C=B2=E3=81=
=97=E3=81=BE=E3=81=99=E3=80=82
+
+=E4=B8=80=E6=96=B9=E3=80=81``Reviewed-by:`` =E3=81=AF=E3=80=81=E3=83=91=E3=
=83=83=E3=83=81=E3=81=8C=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=81=95=E3=82=
=8C=E3=80=81=E4=BB=A5=E4=B8=8B=E3=81=AE
+=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=AE=E5=A3=B0=E6=98=8E=
=E3=81=AB=E5=BE=93=E3=81=A3=E3=81=A6=E5=8F=97=E3=81=91=E5=85=A5=E3=82=8C=E5=
=8F=AF=E8=83=BD=E3=81=A8=E5=88=A4=E6=96=AD=E3=81=95=E3=82=8C=E3=81=9F=E3=81=
=93=E3=81=A8=E3=82=92=E7=A4=BA=E3=81=97=E3=81=BE=E3=81=99=E3=80=82
+
+Reviewer's statement of oversight
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+By offering my Reviewed-by: tag, I state that:
+
+        (a) I have carried out a technical review of this patch to
+            evaluate its appropriateness and readiness for inclusion into
+            the mainline kernel.
+
+        (b) Any problems, concerns, or questions relating to the patch
+            have been communicated back to the submitter.  I am satisfied
+            with the submitter's response to my comments.
+
+        (c) While there may be things that could be improved with this
+            submission, I believe that it is, at this time, (1) a
+            worthwhile modification to the kernel, and (2) free of known
+            issues which would argue against its inclusion.
+
+        (d) While I have reviewed the patch and believe it to be sound, I
+            do not (unless explicitly stated elsewhere) make any
+            warranties or guarantees that it will achieve its stated
+            purpose or function properly in any given situation.
+
+.. note::
+
+   =E3=80=96=E8=A9=A6=E8=A8=B3=E3=80=97
+
+   **=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=AB=E3=82=88=E3=82=
=8B=E7=A2=BA=E8=AA=8D=E5=A3=B0=E6=98=8E**
+
+   ``Reviewed-by:`` =E3=82=BF=E3=82=B0=E3=82=92=E4=BB=98=E3=81=91=E3=82=8B=
=E3=81=93=E3=81=A8=E3=81=AB=E3=82=88=E3=82=8A=E3=80=81=E7=A7=81=E3=81=AF=E4=
=BB=A5=E4=B8=8B=E3=82=92=E8=A1=A8=E6=98=8E=E3=81=99=E3=82=8B=E3=80=82
+
+   (a) =E3=81=93=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=81=8C=E3=83=A1=E3=
=82=A4=E3=83=B3=E3=83=A9=E3=82=A4=E3=83=B3=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=
=AB=E3=81=B8=E3=81=AE=E5=8F=96=E3=82=8A=E8=BE=BC=E3=81=BF=E3=81=AB=E9=81=A9=
=E5=88=87=E3=81=A7=E3=81=82=E3=82=8A=E3=80=81
+       =E3=81=9D=E3=81=AE=E6=BA=96=E5=82=99=E3=81=8C=E6=95=B4=E3=81=A3=E3=
=81=A6=E3=81=84=E3=82=8B=E3=81=8B=E3=82=92=E8=A9=95=E4=BE=A1=E3=81=99=E3=82=
=8B=E3=81=9F=E3=82=81=E3=80=81=E6=8A=80=E8=A1=93=E7=9A=84=E3=81=AA=E3=83=AC=
=E3=83=93=E3=83=A5=E3=83=BC=E3=82=92
+       =E5=AE=9F=E6=96=BD=E3=81=97=E3=81=9F=E3=80=82
+
+   (b) =E3=83=91=E3=83=83=E3=83=81=E3=81=AB=E9=96=A2=E3=81=99=E3=82=8B=E5=
=95=8F=E9=A1=8C=E3=80=81=E6=87=B8=E5=BF=B5=E3=80=81=E3=81=BE=E3=81=9F=E3=81=
=AF=E8=B3=AA=E5=95=8F=E3=81=AF=E3=81=99=E3=81=B9=E3=81=A6=E6=8F=90=E5=87=BA=
=E8=80=85=E3=81=AB
+       =E4=BC=9D=E3=81=88=E3=82=89=E3=82=8C=E3=81=A6=E3=81=84=E3=82=8B=E3=
=80=82=E7=A7=81=E3=81=AF=E3=80=81=E8=87=AA=E5=88=86=E3=81=AE=E3=82=B3=E3=83=
=A1=E3=83=B3=E3=83=88=E3=81=AB=E5=AF=BE=E3=81=99=E3=82=8B=E6=8F=90=E5=87=BA=
=E8=80=85=E3=81=AE
+       =E5=9B=9E=E7=AD=94=E3=81=AB=E6=BA=80=E8=B6=B3=E3=81=97=E3=81=A6=E3=
=81=84=E3=82=8B=E3=80=82
+
+   (c) =E3=81=93=E3=81=AE=E6=8F=90=E5=87=BA=E7=89=A9=E3=81=AB=E3=81=AF=E6=
=94=B9=E5=96=84=E3=81=A7=E3=81=8D=E3=82=8B=E7=82=B9=E3=81=8C=E6=AE=8B=E3=81=
=A3=E3=81=A6=E3=81=84=E3=82=8B=E5=8F=AF=E8=83=BD=E6=80=A7=E3=81=8C=E3=81=82=
=E3=82=8B=E3=81=8C=E3=80=81
+       =E7=8F=BE=E6=99=82=E7=82=B9=E3=81=AB=E3=81=8A=E3=81=84=E3=81=A6=E3=
=80=81(1) =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=AF=BE=E3=81=99=
=E3=82=8B=E4=BE=A1=E5=80=A4=E3=81=AE=E3=81=82=E3=82=8B=E5=A4=89=E6=9B=B4=E3=
=81=A7=E3=81=82=E3=82=8A=E3=80=81
+       =E3=81=8B=E3=81=A4 (2) =E3=81=9D=E3=81=AE=E5=8F=96=E3=82=8A=E8=BE=
=BC=E3=81=BF=E3=81=AB=E5=8F=8D=E5=AF=BE=E3=81=99=E3=82=8B=E7=90=86=E7=94=B1=
=E3=81=A8=E3=81=AA=E3=82=8B=E6=97=A2=E7=9F=A5=E3=81=AE=E5=95=8F=E9=A1=8C=E3=
=81=8C
+       =E5=AD=98=E5=9C=A8=E3=81=97=E3=81=AA=E3=81=84=E3=81=A8=E8=80=83=E3=
=81=88=E3=82=8B=E3=80=82
+
+   (d) =E7=A7=81=E3=81=AF=E3=81=93=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=
=82=92=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=81=97=E3=80=81=E5=A6=A5=E5=BD=
=93=E3=81=A7=E3=81=82=E3=82=8B=E3=81=A8=E8=80=83=E3=81=88=E3=81=A6=E3=81=84=
=E3=82=8B=E3=81=8C=E3=80=81
+       =E5=88=A5=E9=80=94=E6=98=8E=E7=A4=BA=E3=81=95=E3=82=8C=E3=81=A6=E3=
=81=84=E3=81=AA=E3=81=84=E9=99=90=E3=82=8A=E3=80=81=E3=81=9D=E3=81=AE=E3=83=
=91=E3=83=83=E3=83=81=E3=81=8C=E8=A8=98=E8=BC=89=E3=81=95=E3=82=8C=E3=81=9F=
=E7=9B=AE=E7=9A=84=E3=82=92
+       =E9=81=94=E6=88=90=E3=81=99=E3=82=8B=E3=81=93=E3=81=A8=E3=80=81=E3=
=81=BE=E3=81=9F=E3=81=AF=E3=81=84=E3=81=8B=E3=81=AA=E3=82=8B=E7=8A=B6=E6=B3=
=81=E3=81=AB=E3=81=8A=E3=81=84=E3=81=A6=E3=82=82=E6=AD=A3=E3=81=97=E3=81=8F=
=E5=8B=95=E4=BD=9C=E3=81=99=E3=82=8B
+       =E3=81=93=E3=81=A8=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=80=81=E3=
=81=84=E3=81=8B=E3=81=AA=E3=82=8B=E4=BF=9D=E8=A8=BC=E3=82=82=E8=A1=8C=E3=82=
=8F=E3=81=AA=E3=81=84=E3=80=82
+
+``Reviewed-by:`` =E3=82=BF=E3=82=B0=E3=81=AF=E3=80=81=E3=81=9D=E3=81=AE=E3=
=83=91=E3=83=83=E3=83=81=E3=81=8C=E9=87=8D=E5=A4=A7=E3=81=AA=E6=8A=80=E8=A1=
=93=E7=9A=84=E5=95=8F=E9=A1=8C=E3=82=92=E6=AE=8B=E3=81=97=E3=81=A6=E3=81=84=
=E3=81=AA=E3=81=84=E3=80=81
+=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=AF=BE=E3=81=99=E3=82=8B=
=E9=81=A9=E5=88=87=E3=81=AA=E5=A4=89=E6=9B=B4=E3=81=A7=E3=81=82=E3=82=8B=E3=
=81=A8=E3=81=84=E3=81=86=E6=84=8F=E8=A6=8B=E3=82=92=E8=A1=A8=E6=98=8E=E3=81=
=99=E3=82=8B=E3=82=82=E3=81=AE=E3=81=A7=E3=81=99=E3=80=82
+=E5=BF=85=E8=A6=81=E3=81=AA=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=92=
=E8=A1=8C=E3=81=A3=E3=81=9F=E6=97=A2=E7=9F=A5=E3=81=AE=E8=BA=AB=E5=85=83=E3=
=82=92=E6=8C=81=E3=81=A4=E4=BA=BA=E3=81=A7=E3=81=82=E3=82=8C=E3=81=B0=E3=80=
=81=E9=96=A2=E5=BF=83=E3=81=AE=E3=81=82=E3=82=8B
+=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=AF=E8=AA=B0=E3=81=A7=
=E3=82=82=E3=83=91=E3=83=83=E3=83=81=E3=81=AB ``Reviewed-by:`` =E3=82=BF=E3=
=82=B0=E3=82=92=E4=BB=98=E3=81=91=E3=82=89=E3=82=8C=E3=81=BE=E3=81=99=E3=80=
=82
+=E3=81=93=E3=81=AE=E3=82=BF=E3=82=B0=E3=81=AF=E3=80=81=E3=83=AC=E3=83=93=
=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=AE=E5=8A=9F=E7=B8=BE=E3=82=92=E7=A4=BA=E3=
=81=99=E3=81=A8=E3=81=A8=E3=82=82=E3=81=AB=E3=80=81=E3=81=A9=E3=81=AE=E7=A8=
=8B=E5=BA=A6=E3=81=AE=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=81=8C
+=E8=A1=8C=E3=82=8F=E3=82=8C=E3=81=9F=E3=81=8B=E3=82=92=E3=83=A1=E3=83=B3=
=E3=83=86=E3=83=8A=E3=83=BC=E3=81=AB=E7=9F=A5=E3=82=89=E3=81=9B=E3=82=8B=E5=
=BD=B9=E5=89=B2=E3=82=92=E6=9E=9C=E3=81=9F=E3=81=97=E3=81=BE=E3=81=99=E3=80=
=82=E5=AF=BE=E8=B1=A1=E5=88=86=E9=87=8E=E3=82=92=E7=90=86=E8=A7=A3=E3=81=97=
=E3=80=81
+=E5=8D=81=E5=88=86=E3=81=AA=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=92=
=E8=A1=8C=E3=81=86=E3=81=93=E3=81=A8=E3=81=A7=E7=9F=A5=E3=82=89=E3=82=8C=E3=
=81=A6=E3=81=84=E3=82=8B=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=
=8C=E4=BB=98=E3=81=91=E3=81=9F
+``Reviewed-by:`` =E3=82=BF=E3=82=B0=E3=81=AF=E3=80=81=E9=80=9A=E5=B8=B8=E3=
=80=81=E3=83=91=E3=83=83=E3=83=81=E3=81=8C=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=
=AB=E3=81=AB=E5=8F=96=E3=82=8A=E8=BE=BC=E3=81=BE=E3=82=8C=E3=82=8B
+=E5=8F=AF=E8=83=BD=E6=80=A7=E3=82=92=E9=AB=98=E3=82=81=E3=81=BE=E3=81=99=
=E3=80=82
+
+``Tested-by:`` =E3=81=A8 ``Reviewed-by:`` =E3=81=AE=E4=B8=A1=E6=96=B9=E3=
=81=AE=E3=82=BF=E3=82=B0=E3=81=AF=E3=80=81=E3=83=A1=E3=83=BC=E3=83=AA=E3=83=
=B3=E3=82=B0=E3=83=AA=E3=82=B9=E3=83=88=E4=B8=8A=E3=81=A7
+=E3=83=86=E3=82=B9=E3=82=BF=E3=83=BC=E3=81=BE=E3=81=9F=E3=81=AF=E3=83=AC=
=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=8B=E3=82=89=E5=8F=97=E3=81=91=E5=
=8F=96=E3=81=A3=E3=81=9F=E5=BE=8C=E3=80=81=E6=AC=A1=E3=81=AE=E3=83=90=E3=83=
=BC=E3=82=B8=E3=83=A7=E3=83=B3=E3=82=92
+=E9=80=81=E4=BF=A1=E3=81=99=E3=82=8B=E3=81=A8=E3=81=8D=E3=81=AB=E3=80=81=
=E4=BD=9C=E8=80=85=E3=81=8C=E8=A9=B2=E5=BD=93=E3=81=99=E3=82=8B=E3=83=91=E3=
=83=83=E3=83=81=E3=81=B8=E8=BF=BD=E5=8A=A0=E3=81=99=E3=82=8B=E5=BF=85=E8=A6=
=81=E3=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82
+=E3=81=9F=E3=81=A0=E3=81=97=E3=80=81=E6=AC=A1=E3=81=AE=E3=83=90=E3=83=BC=
=E3=82=B8=E3=83=A7=E3=83=B3=E3=81=A7=E3=83=91=E3=83=83=E3=83=81=E3=81=8C=E5=
=A4=A7=E5=B9=85=E3=81=AB=E5=A4=89=E6=9B=B4=E3=81=95=E3=82=8C=E3=81=9F=E5=A0=
=B4=E5=90=88=E3=81=AF=E3=80=81=E3=81=93=E3=82=8C=E3=82=89=E3=81=AE=E3=82=BF=
=E3=82=B0=E3=81=8C
+=E9=81=A9=E7=94=A8=E3=81=A7=E3=81=8D=E3=81=AA=E3=81=8F=E3=81=AA=E3=82=8B=
=E5=8F=AF=E8=83=BD=E6=80=A7=E3=81=8C=E3=81=82=E3=82=8B=E3=81=9F=E3=82=81=E3=
=80=81=E5=89=8A=E9=99=A4=E3=81=99=E3=82=8B=E5=BF=85=E8=A6=81=E3=81=8C=E3=81=
=82=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82
+=E9=80=9A=E5=B8=B8=E3=80=81=E8=AA=B0=E3=81=8B=E3=81=AE ``Acked-by:``=E3=80=
=81``Tested-by:``=E3=80=81=E3=81=BE=E3=81=9F=E3=81=AF ``Reviewed-by:`` =E3=
=82=BF=E3=82=B0=E3=82=92
+=E5=89=8A=E9=99=A4=E3=81=97=E3=81=9F=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=
=E3=81=9D=E3=81=AE=E7=90=86=E7=94=B1=E3=82=92=E3=83=91=E3=83=83=E3=83=81=E3=
=81=AE=E5=A4=89=E6=9B=B4=E5=B1=A5=E6=AD=B4=E3=81=A7=E8=AA=AC=E6=98=8E=E3=81=
=99=E3=82=8B=E5=BF=85=E8=A6=81=E3=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99
+=EF=BC=88``---`` =E5=8C=BA=E5=88=87=E3=82=8A=E3=81=AE=E5=BE=8C=EF=BC=89=E3=
=80=82
+
+``Suggested-by:`` =E3=82=BF=E3=82=B0=E3=81=AF=E3=80=81=E3=83=91=E3=83=83=
=E3=83=81=E3=81=AE=E3=82=A2=E3=82=A4=E3=83=87=E3=82=A2=E3=81=8C=E8=A8=98=E8=
=BC=89=E3=81=95=E3=82=8C=E3=81=9F=E4=BA=BA=E3=81=AB=E3=82=88=E3=81=A3=E3=81=
=A6
+=E6=8F=90=E6=A1=88=E3=81=95=E3=82=8C=E3=81=9F=E3=81=93=E3=81=A8=E3=82=92=
=E7=A4=BA=E3=81=97=E3=80=81=E3=81=9D=E3=81=AE=E3=82=A2=E3=82=A4=E3=83=87=E3=
=82=A2=E3=81=AB=E5=AF=BE=E3=81=99=E3=82=8B=E5=8A=9F=E7=B8=BE=E3=82=92=E8=A8=
=98=E9=8C=B2=E3=81=97=E3=81=BE=E3=81=99=E3=80=82
+=E3=82=A2=E3=82=A4=E3=83=87=E3=82=A2=E3=82=92=E6=8F=90=E6=A1=88=E3=81=97=
=E3=81=9F=E4=BA=BA=E3=81=AE=E5=8A=9F=E7=B8=BE=E3=82=92=E3=81=8D=E3=81=A1=E3=
=82=93=E3=81=A8=E8=A8=98=E9=8C=B2=E3=81=99=E3=82=8C=E3=81=B0=E3=80=81=E4=BB=
=8A=E5=BE=8C=E3=82=82=E5=86=8D=E3=81=B3=E5=8D=94=E5=8A=9B=E3=81=97=E3=81=A6
+=E3=82=82=E3=82=89=E3=81=86=E3=81=8D=E3=81=A3=E3=81=8B=E3=81=91=E3=81=AB=
=E3=81=AA=E3=82=8B=E3=81=93=E3=81=A8=E3=81=8C=E6=9C=9F=E5=BE=85=E3=81=95=E3=
=82=8C=E3=81=BE=E3=81=99=E3=80=82=E3=81=AA=E3=81=8A=E3=80=81=E3=81=93=E3=82=
=8C=E3=81=AF=E3=80=81=E5=90=8D=E5=89=8D=E3=82=92
+=E8=A8=98=E8=BC=89=E3=81=95=E3=82=8C=E3=82=8B=E6=9C=AC=E4=BA=BA=E3=81=AE=
=E6=98=8E=E7=A4=BA=E7=9A=84=E3=81=AA=E8=A8=B1=E5=8F=AF=E3=81=AA=E3=81=97=E3=
=81=AB=E4=BD=BF=E7=94=A8=E3=81=A7=E3=81=8D=E3=82=8B=E5=8F=AF=E8=83=BD=E6=80=
=A7=E3=81=8C=E3=81=82=E3=82=8B=E4=B8=89=E3=81=A4=E3=81=AE
+=E3=82=BF=E3=82=B0=E3=81=AE=E3=81=86=E3=81=A1=E3=81=AE=E4=B8=80=E3=81=A4=
=E3=81=A7=E3=81=99=E3=80=82=E8=A9=B3=E7=B4=B0=E3=81=AB=E3=81=A4=E3=81=84=E3=
=81=A6=E3=81=AF=E3=80=81=E5=BE=8C=E8=BF=B0=E3=81=AE
+=E3=80=8C=E4=BA=BA=E3=82=92=E3=82=BF=E3=82=B0=E4=BB=98=E3=81=91=E3=81=99=
=E3=82=8B=E3=81=AB=E3=81=AF=E8=A8=B1=E5=8F=AF=E3=81=8C=E5=BF=85=E8=A6=81=E3=
=80=8D=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=
=95=E3=81=84=E3=80=82
+
+``Fixes:`` =E3=82=BF=E3=82=B0=E3=81=AF=E3=80=81=E3=81=9D=E3=81=AE=E3=83=91=
=E3=83=83=E3=83=81=E3=81=8C=E4=BB=A5=E5=89=8D=E3=81=AE=E3=82=B3=E3=83=9F=E3=
=83=83=E3=83=88=E3=81=AB=E3=81=82=E3=82=8B=E3=83=90=E3=82=B0=E3=82=92=E4=BF=
=AE=E6=AD=A3=E3=81=99=E3=82=8B
+=E3=81=93=E3=81=A8=E3=82=92=E7=A4=BA=E3=81=97=E3=81=BE=E3=81=99=E3=80=82=
=E3=81=93=E3=82=8C=E3=81=AF=E3=80=81=E5=95=8F=E9=A1=8C=E3=81=8C=E3=81=A9=E3=
=81=93=E3=81=A7=E7=99=BA=E7=94=9F=E3=81=97=E3=81=9F=E3=81=AE=E3=81=8B=E3=82=
=92=E5=AE=B9=E6=98=93=E3=81=AB=E7=89=B9=E5=AE=9A=E3=81=A7=E3=81=8D=E3=82=8B
+=E3=82=88=E3=81=86=E3=81=AB=E3=81=97=E3=80=81=E3=83=90=E3=82=B0=E4=BF=AE=
=E6=AD=A3=E3=81=AE=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=81=AB=E5=BD=B9=E7=
=AB=8B=E3=81=A1=E3=81=BE=E3=81=99=E3=80=82=E3=81=BE=E3=81=9F=E3=80=81=E3=81=
=93=E3=81=AE=E3=82=BF=E3=82=B0=E3=81=AF stable
+kernel =E3=83=81=E3=83=BC=E3=83=A0=E3=81=8C=E3=80=81=E3=81=A9=E3=81=AE sta=
ble kernel =E3=83=90=E3=83=BC=E3=82=B8=E3=83=A7=E3=83=B3=E3=81=AB=E4=BF=AE=
=E6=AD=A3=E3=82=92=E9=81=A9=E7=94=A8=E3=81=99=E3=81=B9=E3=81=8D=E3=81=8B=E3=
=82=92
+=E5=88=A4=E6=96=AD=E3=81=99=E3=82=8B=E9=9A=9B=E3=81=AB=E3=82=82=E5=BD=B9=
=E7=AB=8B=E3=81=A1=E3=81=BE=E3=81=99=E3=80=82=E3=83=91=E3=83=83=E3=83=81=E3=
=81=8C=E4=BF=AE=E6=AD=A3=E3=81=99=E3=82=8B=E3=83=90=E3=82=B0=E3=82=92=E7=A4=
=BA=E3=81=99=E6=96=B9=E6=B3=95=E3=81=A8=E3=81=97=E3=81=A6=E3=81=AF=E3=80=81
+=E3=81=93=E3=82=8C=E3=81=8C=E6=8E=A8=E5=A5=A8=E3=81=95=E3=82=8C=E3=81=A6=
=E3=81=84=E3=81=BE=E3=81=99=E3=80=82=E8=A9=B3=E7=B4=B0=E3=81=AB=E3=81=A4=E3=
=81=84=E3=81=A6=E3=81=AF `=E5=A4=89=E6=9B=B4=E5=86=85=E5=AE=B9=E3=82=92=E8=
=A8=98=E8=BF=B0=E3=81=99=E3=82=8B`_ =E3=82=92
+=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=
=E3=80=82
+
+=E6=B3=A8=E6=84=8F: ``Fixes:`` =E3=82=BF=E3=82=B0=E3=82=92=E4=BB=98=E3=81=
=91=E3=81=A6=E3=82=82=E3=80=81stable kernel rules =E3=81=AE=E6=89=8B=E9=A0=
=86=E3=82=84=E3=80=81
+stable =E5=90=91=E3=81=91=E3=83=91=E3=83=83=E3=83=81=E5=80=99=E8=A3=9C=E3=
=81=99=E3=81=B9=E3=81=A6=E3=81=A7 ``Cc: stable@vger.kernel.org`` =E3=82=92
+=E6=8C=87=E5=AE=9A=E3=81=99=E3=82=8B=E8=A6=81=E4=BB=B6=E3=81=8C=E3=81=AA=
=E3=81=8F=E3=81=AA=E3=82=8B=E3=82=8F=E3=81=91=E3=81=A7=E3=81=AF=E3=81=82=E3=
=82=8A=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82=E8=A9=B3=E7=B4=B0=E3=81=AB=E3=81=
=A4=E3=81=84=E3=81=A6=E3=81=AF=E3=80=81
+Documentation/process/stable-kernel-rules.rst =E3=82=92=E5=8F=82=E7=85=A7=
=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E6=9C=80=E5=BE=8C=E3=81=AB=E3=80=81=E3=82=BF=E3=82=B0=E3=82=92=E4=BB=98=
=E3=81=91=E3=82=8B=E3=81=93=E3=81=A8=E3=81=AF=E6=AD=93=E8=BF=8E=E3=81=95=E3=
=82=8C=E3=80=81=E9=80=9A=E5=B8=B8=E3=81=AF=E9=9D=9E=E5=B8=B8=E3=81=AB=E3=81=
=82=E3=82=8A=E3=81=8C=E3=81=9F=E3=81=84=E3=82=82=E3=81=AE=E3=81=A7=E3=81=99=
=E3=81=8C=E3=80=81
+=E7=BD=B2=E5=90=8D=E8=80=85=EF=BC=88=E3=81=99=E3=81=AA=E3=82=8F=E3=81=A1=
=E3=80=81=E6=8F=90=E5=87=BA=E8=80=85=E3=81=8A=E3=82=88=E3=81=B3=E3=83=A1=E3=
=83=B3=E3=83=86=E3=83=8A=E3=83=BC=EF=BC=89=E3=81=AF=E3=80=81=E6=8F=90=E7=A4=
=BA=E3=81=95=E3=82=8C=E3=81=9F=E3=82=BF=E3=82=B0=E3=82=92
+=E9=81=A9=E7=94=A8=E3=81=99=E3=82=8B=E3=81=8B=E3=81=A9=E3=81=86=E3=81=8B=
=E3=82=92=E8=87=AA=E8=BA=AB=E3=81=AE=E5=88=A4=E6=96=AD=E3=81=A7=E6=B1=BA=E3=
=82=81=E3=82=8B=E3=81=93=E3=81=A8=E3=81=8C=E3=81=A7=E3=81=8D=E3=81=BE=E3=81=
=99=E3=80=82

base-commit: d793bcfca6bb493eb8e93900285f951a0c9dbf7c
--=20
2.52.0

