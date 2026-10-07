Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F730394EBA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362657; cv=pass; b=HBd8JoRvvySm6G7uE5OjIrr6OoG5DpKJtFL2zYgKCR32Q4yaKUw2tNZuACwdSiCmnCaz2JUqY2buFtkUkzuhThDRUle7qy14wNxbm/8x25oxtz4QqG0irPT5QvJT86XN3oWAx/yBRL/PFzumLYx3nt2nBI8CGxrb9s+/vu5z7c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362657; c=relaxed/simple;
	bh=ShHUO7mPTrqlSS4cXnMvGeM4pkz1AlNdBLozhKe9y5E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uIK1sdIlmAHKuSlOHexpGTkZXwrUpppHBw/O8l0Ud22l6Pl163cGq3CdVirZaKvUUOX8Smpo5SwFCYrD6VmJ2KYtkyI9cJF0/l9bUgR8o+xPdz+mDUwfYzEldk6XG/VTAP/hw7Jh0rdP0LDWyKci0QtwEPTKTXuyXqzrYKj8Hms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQlUnKmv; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQlUnKmv"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533972e0cccso14054011cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791362655; cv=none;
        d=google.com; s=arc-20260327;
        b=KIzgXM57I75Uf2K8uOyWKT6NyW6cqaWcNy61LHRrsPxxrzHuedJo7byymppDGcnUlK
         HqRc3NG0quoR/hpIUlkB2I4qxEaOcPbwfUhfZeBd4yePUEkFFqpQKmMU6qycFZOg/wf9
         bVMy8RDaftJgWOaySeLtrjaon55oNeMGkUXeYt6yC0ruOJZH7SYKRuq6HAOkA6rolqzs
         du6lct/fYuSSFBYWJr0ArdAJNjl65vZkWlIcBuJggaHGYH497KSj6ECMuPkdZlI6dgj2
         a3qjgEDOqhB5TJWqbp8DJs3v/6eugq0V8ekp9hFjE6DxbdTRefsVzv/1ENjDX53cWQTy
         6uJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=UQHkn3xShl+rCSGZ+dRdU7pRSbW50bIYa4iEZV1gMbo=;
        fh=Bm7enYATSMaAgjcrplYv4HJU2CAuF218XlOigQSBf/Q=;
        b=fPunT8M/AUayGiZ8oMKO6NG2t9lbwV22itgqwCJpRO7IEgTurP1ZjeZUBA6VZWvklA
         iyYW+m3y34JxQAndB1T7mTdjpMQeraMsZ428VOn+KPH9jXtPgR59/tewEdI34d8tDvOQ
         V5r+ACGZBr5xIT7Dq8QBuYDbLKEa8KSAyGLCU2Q2bFUvmT0Y2/B4jq7iZ/uJCgi4PLd4
         S5AWJy99A4F28/NfUP00LxljCHXrX6hhXOp5KaR2LBTGnivXzQZ22CmjN8jkh3kEavqV
         FO/acYbUpLPPIEvo9416XgVbzGiGMVBmfXQlHV/udKd3TwUTZaUfUn0lhVe2ekIHDYaT
         AC4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791362655; x=1791967455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQHkn3xShl+rCSGZ+dRdU7pRSbW50bIYa4iEZV1gMbo=;
        b=MQlUnKmvb658lGt/htuFe9ydDaAsJ9BgktphEkMFGe+9WN/9EHwev9w2I39f2mAHmD
         hsgE6R4vWibDhFdZrAOyj7fzgYeg4uWOb1r7oT+BcgnJRnSjUstAC8q0WBduLyCa+j08
         WU5/27wLM3lXKfS4pDtFS0ZSdXBKN+HKSZlyCt2kUkGp3zBu1NYR7Kv3CGr3FjgWWntG
         yl5STvbaOvJQXun5a0PQwIEdFwsNJoqgxEZKvXDYFMBlqhGJu3sDMyOTECNKQ3MIa4r0
         F2wIqf3WOpfcYTux3pYAUuX2uRtbyX8Ksq85Pttmbvhv9xVGYGeJi4oXKA0ivZvL0qHP
         MC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362655; x=1791967455;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UQHkn3xShl+rCSGZ+dRdU7pRSbW50bIYa4iEZV1gMbo=;
        b=qqw9NVzw+JhFA7Wb7xSKGWpb6BFgxY2e5calEU1IrqTzfCF2Uvap5HFElWLb6kL8+k
         B5QjVrBD7SEBGKaunFKqkX5rvNB6xs3Qu+0QsyyLUDLEHowifrC1aR7LJSORSZZDcGz4
         15UMWiWusJq4sBWYbPflV13eBjwtmSxZueflnpwhC/QJqlCMW6EiBO3ySey3c466EZa0
         3b2Wot+724BscdxrI1qS8gfqAQO+FJoknkwB43dn2Ab3lhr8F1H3mnarIDEhy7YJ+OnA
         9GDN24GprlhOgHKyKof8GIXpQqH4AHStEmRNVNezNWOhYYMCW+LnpYaAb/Zsv9QEsBCc
         OcDw==
X-Forwarded-Encrypted: i=1; AKwUvBzjgZsUiFjeL7P2Us7xQhL9iDCZFC5nzqUfNoUBQcb8WUosB0LbFTCY7+/prjhUKPqc7wo6JP94Ml1Vxwk=@vger.kernel.org
X-Gm-Message-State: AFuF++k1alFVqUzvo/6y/5YOPjWqla26jkTh7XM8J1Ms2wHfXIcXrhp9
	yvw+eUJNFNGvvCwH/yGh5IlLbRFf341gYxZFDjqWjYBhxdJPWvv+NSQq/apeJJMQtZY8UZQY+v7
	lBarB7ZkqV6R4cT9tiF6ZWPRpflxiOpyjTJcnRp0=
X-Gm-Gg: AYBFou354B72WywS//9I7ikJlkGJklN126p1PpfVfHy3KpN9t+hG8Ht+b9vClqZXTMG
	kk1e8vmUP9BPf6dItrIkGkI0q1P/bkrqghThPENeIU8gfo2Jl32dx0u68qpdYBiIMydH4f7L+j4
	DKKYsuBkEjKQaSk+rCVNP1js9Dk7e/nk64c4w/4Dtu38Ifyy2Tu1pmIa2cnQNoWr2CAuB+bD365
	pRiVdAa6jP3xXvEHKqP3QRtDkmnmM7lpG9RntHLFsCW0piXQfYGf03s8BP5DIXvLCAEO04YNYwn
	FHCOmXPWmpWI20xF8a5pFz1vqlYhDcnERX1HO+lNL5apuPXR4SvorEV/eiSSb+7/WyOqUtaiD65
	jAJa+u+QF9ckezW1LisDy3+/I6UBVaD6slnOAtBczzykQQAt+ZCH4h2euZrOuli6w4W++JAJ90v
	3i1ojRH1cNl/8PofnGh/lLVPsKvnSUCl+5Zb32AzbPQhHsISt1mQCWfe5QpUkuwVIbAioQyd+Bb
	X9t
X-Received: by 2002:a05:622a:1806:b0:535:70c4:9a96 with SMTP id
 d75a77b69052e-535757e25b0mr24745931cf.76.1791362654939; Wed, 07 Oct 2026
 01:44:14 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 03:44:13 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 03:44:13 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ting-Han Hou <ue081723@gmail.com>
Date: Wed, 7 Oct 2026 03:44:13 -0500
X-Gm-Features: AclHuK9fTQbtyZxD3wrfJLJ_jHQiU4Fw4p6ZmXpfoAwI_aLMJpQmgaQ1fIuWgfM
Message-ID: <CA+NtrhQqXgjT+4eg6W4P94Hc=DqdV3gQXz3EKKCxWvdWzfND6A@mail.gmail.com>
Subject: [PATCH] checkkconfigsymbols.py: Parse Git status output line by line
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ting-Han Hou <ue081723@gmail.com>

tree_is_dirty() iterates over the string returned by execute() one
character at a time. Its status check therefore examines filenames as
well as the two status columns.

An otherwise clean tree containing an untracked README is reported as
dirty because its name contains letters matched by [URMADC]. This
prevents --commit and --diff from running, whereas an untracked
notes.txt does not trigger the check.

Split the output into lines before examining the two status columns so
that filenames do not affect the dirty-tree check.

Fixes: b1a3f243485f ("checkkconfigsymbols.py: make it Git aware")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
 scripts/checkkconfigsymbols.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 36c920e71..9f7aed98d 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -245,7 +245,7 @@ def tree_is_dirty():
     """Return true if the current working tree is dirty (i.e., if any file has
     been added, deleted, modified, renamed or copied but not committed)."""
     stdout = execute(["git", "status", "--porcelain"])
-    for line in stdout:
+    for line in stdout.splitlines():
         if re.findall(r"[URMADC]{1}", line[:2]):
             return True
     return False
