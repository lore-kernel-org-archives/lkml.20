Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C731862
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 00:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791074526; cv=pass; b=rqfkvUf8Mu5P52vxacWyalyB/m2VI3BMUObMAZTUh2pKszFdxbI1x2iwp1hOOKrWw9ttvhB0/SLVE07f+bLW45MF/bVqbOIlyd7YjBdV9mlESWfnHMxPY6GyckMCf1T3P2qiwvGn71ozW1iXU5K6qHf60/3AEqIh8ESPp/kAqyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791074526; c=relaxed/simple;
	bh=dHr0OawiCLd6m2U4JBqHZVS4mxav9BEtzts0wI85RfI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Pulfn8zyTiRWomd5uPz0ApE3ORP2YHY2E0UjMVd+54byYGMp6WPjZpp/tZgqb9l896NZoE6vqACXRtmbO44jC+5sUoAGfJcNt8z1iOLyEM7YfiHhlFzvDh7HnAT0OEgH3jJt4j1zfj3Fn64OHAUQC01HfizdEMF72RJUWzBs42Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=solom.dev; spf=fail smtp.mailfrom=solom.dev; dkim=pass (2048-bit key) header.d=solom-dev.20251104.gappssmtp.com header.i=@solom-dev.20251104.gappssmtp.com header.b=K0GgBnbw; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=solom.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=solom.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solom-dev.20251104.gappssmtp.com header.i=@solom-dev.20251104.gappssmtp.com header.b="K0GgBnbw"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-82389b6da4dso959214a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 17:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791074523; cv=none;
        d=google.com; s=arc-20260327;
        b=abQ7wv8T0fZy3MzJKQg6q3DklCxpw32ohK8IQBaglJ5bTJyFBFOIAXDwQnCldAuJZz
         xvOAgsblniTQva4r6am4C+dp1ymYUNwYyy5xNr5yjssdOW7GrBoH7VH+6TpFvHXBFNAW
         aconIjsVn13bZiXYGpJ/FSWpzt8pGVERzaAxVYvIiHxNBbxzqkAyOxos++wBjt/Y3TBy
         NDoj14vHOVwmetKS7sA8lo/tzHMEGI2TmbpH9QUA90s/1J8+j0siCsBztra0ZVmmDyGk
         M/FSh89poov+m67eV+Jhv2ZjQjPgVpULqfeEZScQ6LX4aIZdC2eKMBIkeZbAD9MvhS3i
         cg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yz8y+ZWxaN6SYlrNOvWQGh0SwawyuvVdxArSOnuaZ8Q=;
        fh=pqHsaGASWbKxmhStGqFwWA8Lzas/3XgCf2jmOAruJCI=;
        b=eHZOQd+2MUpiuZyCS57YcCF5Gg8/JnP5O1+oX5ThqZNmM1QT5BR7/C7PwaD4QUgwxM
         PoO/hJg7/AI+Qz8EaRZ7yVY+IzNRyu3uDec8C4NJbsFwyVsNyLMNNQrRPKpb8NNVkDK5
         sq1Qd3Ow89fgqnma6OgclLReDTNjSZLUn545Rqd2IBDRNqjFundkz8wEQVC/j3+2viGe
         f/OUaD0iWtOK2e364Eqo8NXLt9N+dZnrokhoRD+r2HiFpym7vlE8J+VPYdHHpLz+yNzb
         Vt1jNEOfiaoMKUGQ9wo+OviL3/AhJdh61zniyPhjfb9Q7g+dbCU7sKm2Rjo3A819To8q
         O93g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solom-dev.20251104.gappssmtp.com; s=20251104; t=1791074523; x=1791679323; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz8y+ZWxaN6SYlrNOvWQGh0SwawyuvVdxArSOnuaZ8Q=;
        b=K0GgBnbwaca7evG0h0FotwrJVCVidUiBN0c9yUbOtN+DKLbY3qxm8buI6kqAGCd0K9
         JdD/DvCnOAPhL80GLgZRATpEDsrZ731pFU0hbjIk4wf9qMLAddpwghp8mqUjrbbJ59QZ
         0copUMWUwwxtkR1WWT28x+WXsFbj3g6D7p6py7uFmqi/OsiWEdmBwytX1glJpk20C1EL
         fWdnY61hEOqOJNlU2VujjjHFXNjQSv3eFgp4z12HvOg1AzcyhfRXzhshF3W4STD49O/i
         D4ST7k0Ag3aFItCvTrMpSv1bBI/Y4KSrUVpZqXqQKzSE4b/EpU+KftW8CDtsBp41nMxF
         WdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791074523; x=1791679323;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yz8y+ZWxaN6SYlrNOvWQGh0SwawyuvVdxArSOnuaZ8Q=;
        b=iXpUcqRg4eTcz7oBOMxb2C6O8+nJBb1hNH86sM2I1A/wr8f6zG+DcZp8e6b+lRk1cF
         0+9Pj/xmr/iVqnUft1Nz/+QxNw371mLmuNS3JQNTxhFLqkuTzaQg7g/uQFMfX/V0sPiT
         E9MdWCXfLnSuZdhArjV+xCe2LhPSg+zvfaW1Ojg+Rc7EGYgkihYD3oZ0ffjaOpMfs7bo
         g7yXQv4ko9M1OLZ68CaRu62OjVTt/UuOAn+2y6l+wc6kcNCq/lm7mw2pU8DQrGDbi1xe
         Qqk9WYTXzJWqN4DukG6WNYMSq9PQJR0/G7ASz1hiqTer5i9lA7rXphjDWkP/6YGGLqZc
         JmkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCK3oYWw+xlicFc/JLL1YM7c19ZxmM1gfSAbaUoMvECaZyUHsAPYMouzY1OtOt/gahEOnv8fhees+GGNA=@vger.kernel.org
X-Gm-Message-State: AFuF++nji3fwCHyuDS8yjNCEf4ZJO217SV9TC4eq2AZDuwnbHSo9yDIV
	kZe89FIPUb8FVyeULxBjG+BV7Z+C2IS2Tf9HLFpAnjWRhgG4VEFeYeGKL0XuN1CfB+ajrTJMifU
	do6DgfR9B71/wHJIyhUOnKGxeG2kW+WYl6v59CJMtig==
X-Gm-Gg: AYBFou2TfcMGsbuV012c9hNn8sxlhzYvHaHkaq0rA0GxRwFicDZGqHji0u99pj6YVxH
	kcMEGOUiX4YLa6dVzDNrnHDmmgAbUXZOcFH9OjDRtP+12YEzM1cmFoxOcMNsDuWf0jLHVLM29H8
	zBGbJiBH3OgQoYFnOtqBWHVyLBZwjcsx9ISROkJEvnQ2ACL50wpbG5dzcRN3PDdBILWkeBcxpn+
	afPQxGOL9l8pUag6w2YKtABjmngY/AWZEuGt0B8cUpZuuJZrKRTNm8ab+fwZzdjSWyb9F4LWRnD
	7rTnn3miIIkf4lTvQZTV5v/l3w94PDa9ljVAaMs8aEoBtgyKt6h2yeQp/n7nqVOnqws=
X-Received: by 2002:a05:6809:53:20b0:4f5:cb60:33c5 with SMTP id
 5614622812f47-4f5cb603dfbmr3485965b6e.6.1791074522839; Sat, 03 Oct 2026
 17:42:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Solom Tamawy <solom@solom.dev>
Date: Sat, 3 Oct 2026 17:41:52 -0700
X-Gm-Features: AclHuK-uRUXQjKtvXJpq4QctVEAPOr84ph67KwJ7gm3zkr-Y0shQUBKodqrNHfI
Message-ID: <CACbN=AsQdd1GsAA1FpNMZCrd4YNHidX_dQ1CmBW4zYUnHbrioQ@mail.gmail.com>
Subject: [PATCH] drm/nouveau/kms: defer window LUT disable until the image update
To: nouveau@lists.freedesktop.org
Cc: Solom Tamawy <solom@solom.dev>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A modeset on one head can set flush_disable for the entire atomic
commit while another window changes from an integer framebuffer to
FP16 without a modeset. The latter sets clr.xlut and set.image, but
not clr.image.

nv50_wndw_flush_clr() clears that window's ILUT before the intermediate
disable UPDATE, leaving the old integer image enabled without its LUT.
The new FP16 image is only programmed later in nv50_wndw_flush_set().
On hardware that uses the ILUT to convert integer input to the internal
FP16 pipeline, the intermediate state is invalid.

This ordering defect was found while investigating a Plasma login hang
on GB205 after atomic modesetting became enabled by default. The failure
logs contained window UPDATE exceptions followed by a core notifier
timeout:

   gsp: Xid:56 CMDre 00000001 00000200 00000001 00000005 0000002d
   gsp: Xid:56 CMDre 00000005 00000200 00000001 00000005 0000002d
   drm: core notifier timeout

Defer the LUT clear until the image update when the old image remains
enabled across a separate disable UPDATE. The LUT clear and new image
then take effect together. Keep early clears for windows whose images
are disabled and preserve the path without a separate disable UPDATE.
Pass flush_disable explicitly to the set phase, since the new plane
state's atomic-state backpointer is cleared during state swap.

Fixes: ebf8ca6b3d6d ("drm/nouveau/kms/nv50-: disable input lut harder")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Solom Tamawy <solom@solom.dev>
---
Based on linux-next f0406245cb9855e6318335a8a223551354291a46
(next-20261002). This is the functional fix only; atomic modesetting
remains enabled and the advertised formats are unchanged.

Testing:
- A focused C harness extracts the actual pristine and patched flush
   helpers and models two heads at each UPDATE boundary. The pristine
   helpers fail the mixed-head integer-to-FP16 case; the patched helpers
   pass all 14 cases. The model is not a full GPU simulator.
- Nouveau built against the matching kernel configuration and headers
   with successful modpost and BTF generation and no build warnings.
- I successfully logged into Plasma Wayland on RTX 5070
   (GB205), with three NVIDIA DP displays, amdgpu active on the integrated
   GPU, and a CalDigit TS5 Plus dock connected before login. No atomic=0
   override or USB/PCIe/Thunderbolt PM workarounds were present. The
   expected patched module was loaded, and the I confirmed a
   successful DRM_CLIENT_CAP_ATOMIC=1 capability probe. No Xid or core
   notifier timeout appeared in this boot.

  drivers/gpu/drm/nouveau/dispnv50/disp.c |  2 +-
  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 13 ++++++++++++-
  drivers/gpu/drm/nouveau/dispnv50/wndw.h |  4 ++--
  3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e91130f93db6..b7022a9b6e6f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2351,7 +2351,7 @@ nv50_disp_atomic_commit_tail(struct
drm_atomic_commit *state)
                     (!asyw->clr.mask || atom->flush_disable))
                         continue;

-               nv50_wndw_flush_set(wndw, interlock, asyw);
+               nv50_wndw_flush_set(wndw, interlock,
atom->flush_disable, asyw);
         }

         /* Flush update. */
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 74eb1dfcc043..ac59219e162a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -137,6 +137,14 @@ nv50_wndw_flush_clr(struct nv50_wndw *wndw, u32
*interlock, bool flush,
         union nv50_wndw_atom_mask clr = {
                 .mask = asyw->clr.mask & ~(flush ? 0 : asyw->set.mask),
         };
+
+       /* A different head can require a separate disable update while this
+        * window only changes format. Keep its LUT enabled for the old
image
+        * until the new image is programmed: integer formats require an
ILUT.
+        */
+       if (flush && !clr.image && asyw->set.image)
+               clr.xlut = false;
+
         if (clr.sema ) wndw->func-> sema_clr(wndw);
         if (clr.ntfy ) wndw->func-> ntfy_clr(wndw);
         if (clr.xlut ) wndw->func-> xlut_clr(wndw);
@@ -147,7 +155,7 @@ nv50_wndw_flush_clr(struct nv50_wndw *wndw, u32
*interlock, bool flush,
  }

  void
-nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock,
+nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock, bool flush,
                     struct nv50_wndw_atom *asyw)
  {
         if (interlock[NV50_DISP_INTERLOCK_CORE]) {
@@ -157,6 +165,9 @@ nv50_wndw_flush_set(struct nv50_wndw *wndw, u32
*interlock,

         if (asyw->set.sema ) wndw->func->sema_set (wndw, asyw);
         if (asyw->set.ntfy ) wndw->func->ntfy_set (wndw, asyw);
+       /* Apply a deferred LUT disable together with the new image. */
+       if (flush && asyw->clr.xlut && !asyw->clr.image && asyw->set.image)
+               wndw->func->xlut_clr(wndw);
         if (asyw->set.image) wndw->func->image_set(wndw, asyw);

         if (asyw->set.xlut ) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 7bd8bcc199db..b0b1b10cf782 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -40,8 +40,8 @@ int nv50_wndw_new_(const struct nv50_wndw_func *,
struct drm_device *,
                    const u32 *format, u32 heads,
                    enum nv50_disp_interlock_type, u32 interlock_data,
                    struct nv50_wndw **);
-void nv50_wndw_flush_set(struct nv50_wndw *, u32 *interlock,
-                        struct nv50_wndw_atom *);
+void nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock, bool
flush,
+                        struct nv50_wndw_atom *asyw);
  void nv50_wndw_flush_clr(struct nv50_wndw *, u32 *interlock, bool flush,
                          struct nv50_wndw_atom *);
  void nv50_wndw_ntfy_enable(struct nv50_wndw *, struct nv50_wndw_atom *);

base-commit: f0406245cb9855e6318335a8a223551354291a46
