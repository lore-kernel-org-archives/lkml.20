Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705186;
	b=5ekFMu9SqxpnYp9J+Qdx7TipAcs+xmx/Uha9HCmXQUZJbHoVpQWjuOb+1tGnNZVrni69
	 hAss3LKJRdPLbTbggqADyT0Q/3cN4Sy9VsYC3ArmBTOyJcg5nO314u65BvX4YI1JaXhHM
	 vzDTgs08BqXFnnFDbzs052KGjSdTqy7kUiWabLNEIDwQ4250KShh+TmQeirKxtSXi3UBe
	 Ih0Y4TRg7FSeedW7GHorRFSs2FsLPHlYr/IrnrZCzoUfqp58vzuMm0Wm3pS6gqj4FUL9u
	 GMd2KWw6BvcgC8Zs4LttgGPe0ea3NzRhGnbfEB7TOGDvkcmYeaJReiEkEOD8DwGcGGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705186;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Z2X0Jeug+OQ9OToBM5uGRLhD7kuoS30CxEpkBxTSHVs=;
	b=U+ZzYrTGg4jRq9bfWSHa7OI7XUM07Y9Gvs27kjGqqAFuhLGG3N+o7J7U96TgCHEqCpLh
	 51p0nXiX3Csqap/opkTwx9dPHLOt9bFzbvQKQgtw7OfnDcqGnuSSx/gdFW/CgxNlqjOpQ
	 bgp/WM0mgCL5Yxyv6KjBjlz3Z0v75M+Lro7UsxuSa+01jQGlXlmSo/MMGInjyrZ4nnfM4
	 ZQ/DP+pqgcJ7mfXhIjFsF3XeJjAq754BoiYUF+Ucgk5oaph4VftLbZ50gtDNgCNOG5MmN
	 zu+yP13tF0MHa6CvoM5nGU+Vy6WalNU22owOOlBsEGCtjGUDS5N4+6hw4fCBIsSJxuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=llJonDdN;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AFE606BFA0;
	Tue,  3 Nov 2026 11:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AFE606BFA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=llJonDdN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793705178;
	bh=Z2X0Jeug+OQ9OToBM5uGRLhD7kuoS30CxEpkBxTSHVs=;
	h=From:To:Cc:Subject:Date;
	b=llJonDdNyr1CVEhgkuHYsxnLiXMkskNuetmmeYa+dQLfO++nARIaMJxAixPSPjTmm
	 6F38az7+r8Pt41wS4OpZT+l5gNxRPzhTvkEXXMrO+qktzH8nckXTXvdGC8hEw1lJgM
	 rRvz+4KWSvMFOyN0mhLuw7ocjzJeDFch72+BGwYE=
Received: from HAPYCAO-MC1.tencent.com ([2409:8a1e:14e1:720:499b:5d4f:e447:1236])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 69003A78; Tue, 03 Nov 2026 19:26:16 +0800
X-QQ-mid: xmsmtpt1793705176tlvqmn2fe
Message-ID: <tencent_E90BB4F086165FAA3313723567A5C675EA06@qq.com>
X-QQ-XMAILINFO: NIcblQ53mXmREmXN2W3RhLEmIkanWYacW6ErS/elMYzTUTj8+Qp1pu+lAWo+iL
	 lwxlEecVl9/5l8PSz/5DS654NrYjv3rdV2DjnWvKNYWGa2JhzK9YNNdBbbGcECIwRrUZs2SfNvp2
	 MuayInNaQA2e7XNkwF8DzXxA/fWTNS/Rwa9+3dLEU5S3lftZml97IoAt2vBO46qLo4qaQkvBviFd
	 qXgDkjuOScj7MHx02lPWcINZ9i0IMhKZrnqU1qx7m34BX+sYQEWyzE3rM7L8X7Ht1ovXfuI90tE6
	 ZNx3iyjDP2Fr1MTt5zvh4SoP6dBiAKArITMepwRiCytM5v/n5SfxU/1HvY5zmFae1ePOLgUzcOJR
	 GrwVEvcSVsGdewStCsbTKsPLN0vle2jpWTKxKmhfeYOB8lpGMPR8l/gxZQhsWjpwt6/69V0jZ6Cf
	 ZHDViBww6N7a5IPo/ci7Wy4nfP2dkzkWGabE0b4FcxiX7SrzrPUjOpg/x6qMmsu5eNR31Rl55vj8
	 V0Cs/bJtx63STWR6sHqYrxAW+QcIvoo0PNw7gB514t7Qsd6j4y/X4f41F27wxB54M7dYDAnso73N
	 HcjKxLBixk7ICS43bFBoNQ97r0CfrXzlGdoq3Y8LobfLALXDqYRC1HzBg9deQjyIL5pEvxQ+P9FM
	 el27FI/5QiFxeFpNZhrZfPDs6C+vdwhqc4bEUMjAUfN5oJeF0//Y5/0ECtHcB+HqBFpkD128o0Q4
	 sfcknpiy3YQ/BjCvlu+C1xdMH+VLIDdxZjQkG3eZ707oen2VrCxvXoBesswccf0Y+aJIOileVi2O
	 ZOOrp34/V2zx9OVK2XO+WC/Oft3CFcyGME1SNWbXCArh2Yt/Cg7WyZuoBEhN0cMwzYySY0OSUDdo
	 KMkoVfKF2tPgzPyHitVJs64P1mCeK0A/LyAFnopOYe4KNVpDfl5a4CGZhujTlupIqUcw2erjhs2t
	 ZWk42EwVnHHhkiuoEnzqlX5Sly1HsI/TPQYfQNh7UGqkuAedglNfveN3dpoDTTfef3jBY5o4A4hh
	 /komK2yyDNCq/Q4xFN4LQuPEFCgJae8AbDVo04I0CGsrasfuIIogkqqja/8QU6lRjINCTI1tbLlv
	 vW28CQs0JkC0Tyaotvrh8G18kipECN7ya4y+KsuRPqjp/PAX0=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: bo cao <treebacker@foxmail.com>
To: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Bo Cao <treebacker@foxmail.com>
Subject: [PATCH] ALSA: pcm: Don't release the DMA buffer while it is mmapped
Date: Tue,  3 Nov 2026 19:26:15 +0800
X-OQ-MSGID: <20261103112615.26332-1-treebacker@foxmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

From: Bo Cao <treebacker@foxmail.com>

The hw_params state check refuses a re-configuration while the data
buffer is mmapped, but it carries an exemption for OSS emulation
streams.  The OSS flag is kept on the shared substream, and a native
ALSA fd attaching to an already-open substream through an O_APPEND
open inherits that flag, so the exemption can be reached without ever
touching the OSS emulation layer itself.

When such a stream is re-configured with a larger buffer size,
snd_pcm_lib_malloc_pages() releases the old DMA buffer pages, and a
failed re-configuration releases them through the hw_params error
path.  Neither path checks whether the buffer is still mmapped, so
the pages can be freed while the userspace mapping remains in place,
resulting in a use-after-free of the mapped pages, which is
exploitable for privilege escalation.

Refuse the buffer release while the buffer is still mmapped:

  - snd_pcm_lib_malloc_pages() returns -EBADFD instead of freeing
    the old buffer when the new size does not fit it and the buffer
    is still mmapped (same-size re-configuration, which is what the
    OSS emulation layer itself does while mmapped, keeps working),

  - snd_pcm_lib_free_pages() refuses to release a buffer that is
    still mmapped, which also covers the hw_params error path and
    drivers freeing through it,

  - a buffer retained this way by a failed hw_params is released at
    the final close of the substream instead of leaking.

Fixes: 0df63e44c3e3 ("[ALSA] Add O_APPEND flag support to PCM")
Cc: stable@vger.kernel.org
Reported-by: Bo Cao <treebacker@foxmail.com>
Tested-by: Bo Cao <treebacker@foxmail.com>
Signed-off-by: Bo Cao <treebacker@foxmail.com>

---
Note for the list: this issue was originally reported privately to
security@kernel.org; an accidental CC let this patch reach the stable
list early, so it is now submitted through the normal process at the
security team's request.

A word of caution on my part: I am not a professional kernel
developer -- the analysis comes from an independent security research
effort -- so please treat this as a starting point rather than a
finished fix.  In particular, review of the snd_pcm_release_substream()
hunk (which ensures a buffer retained by a failed hw_params does not
leak) and of any OSS emulation behavior I may have missed would be
appreciated.  I am happy to iterate on a v2 with whatever approach is
preferred.

Tested on linux 7.4-rc1 (arm64 QEMU, snd-intel8x0): a reproducer
fails cleanly after the fix -- the second hw_params returns -EBADFD
and the mmapped pages are not freed.

 sound/core/pcm_memory.c | 8 ++++++++
 sound/core/pcm_native.c | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index cfe9f10e7359..ed3da74e2cf5 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -439,6 +439,11 @@ int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 			runtime->dma_bytes = size;
 			return 0;	/* ok, do not change */
 		}
+		/* the old buffer may still be mmapped: refuse instead of
+		 * freeing it behind the userspace mapping
+		 */
+		if (atomic_read(&substream->mmap_count))
+			return -EBADFD;
 		snd_pcm_lib_free_pages(substream);
 	}
 	if (substream->dma_buffer.area != NULL &&
@@ -488,6 +493,9 @@ int snd_pcm_lib_free_pages(struct snd_pcm_substream *substream)
 	runtime = substream->runtime;
 	if (runtime->dma_area == NULL)
 		return 0;
+	/* the buffer may still be mmapped: refuse to release it */
+	if (atomic_read(&substream->mmap_count))
+		return -EBADFD;
 	if (runtime->dma_buffer_p != &substream->dma_buffer) {
 		struct snd_card *card = substream->pcm->card;
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 5cbf88da7626..8e337983f2ec 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2851,6 +2851,12 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 		snd_refcount_sync(&substream->runtime->refcnt);
 		if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 			do_hw_free(substream);
+		else if (substream->managed_buffer_alloc)
+			/* a failed hw_params may have left the buffer
+			 * allocated (it was still mmapped at the time);
+			 * release it now that the mapping is gone
+			 */
+			snd_pcm_lib_free_pages(substream);
 		substream->ops->close(substream);
 		substream->hw_opened = 0;
 	}
-- 
2.39.5

