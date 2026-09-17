Received: from mail-qv2-f5.google.com (mail-qv2-f5.google.com [74.125.230.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E272A34F247
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616585; cv=pass; b=HMspwWCvZy7REjUTj4j405M1aHQ+Q9BTUgAIANTIR4Uy2Zb1YQU2y10CREDBKsgGe1aDuMGraudXEBUEOgOhORGOOONtSiyoPbbbOgUOrO6NxbftoitasEsSBdQf9vm873deVOZwmBW9B0V8GmFixas3yP+m5WSMP7y9JR/v9bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616585; c=relaxed/simple;
	bh=HqkdQHk7vGIuRdqQeXYqrP9OmNw41tjLpuhU2wHfwVI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EADLrxSO/pyza8TG7q/ioeoC3Z60Ehk+zPSI0DcCREeWWKTcGJNYLCY9JkyCYWNM3tP2R+9mHMdvQaVxClxCsy5mCyMCeUJAtV3rhdz+W0NG/Ij311BdFNALZ8y5OmMpeVfB5PCHB9AfqZxeAS/Ixm1RLEgegAUT/fWy809p274=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c326Lo1K; arc=pass smtp.client-ip=74.125.230.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c326Lo1K"
Received: by mail-qv2-f5.google.com with SMTP id 6a1803df08f44-90cd1be1f12so1208646d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789616583; cv=none;
        d=google.com; s=arc-20260327;
        b=NfCtMngawpMnRwodhNLI4deLngIXLcLJ7YizBxZvzkU4psMSqByQgL55HjcsMMW4UT
         DETAtCQ3IMOoIRdXU7KBZQOClvN9HLyvTmXcVgbuU7iwe0H/B2FE9tREALD5D7AkJ0HC
         hDBzRGuiWfktibfSyvT6mSxyq+6oTmR5/IkChPorIFdlF2Kmf4rA4WumG81ich1ui2S9
         PtnAQ6Xgbin1MylrvEMyBDn1g5iPZx9W/YpXZTtQAM3ZvRez+nnxaCsdtF/+E7OJiOPK
         xq51IXu7JjFZked7e61JHn6kaejBZvLNIuCeNTRsHYkRgZjVqZX3vaUNn/640h9e6r3J
         0Qig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=uUKooj3G6MZFzE1OIpQtE6ekzTvNkzFnwYCrZqQvghU=;
        fh=pWavc8Gt8I9NbkvsiXwuxwjUcqGgVgW0U852DJTLCT8=;
        b=rvEDyrSRo9SzHF8+q1Yh+47JP3n/URXF1BrvWQo0WUshJkchP3/JK+3AxmXRBkBs3M
         NhGXUVuiAdfixnmw/4ZaDQcyn51J2z4/9najNQijto61yTryKhOEHd6AfiEN9zIbkHq0
         tw6VII25kOxpOdwYPRR18/mJ1jAgmCJtO/awlZeNZgD5XDA0vbytCgTAPEYgiJ6N/VYH
         ry1uF2hyNLavJlHJinjAuRFDrYbxnlEC2ZX5zvKbdCFo+0Kn3z/OEDJsYFEQLsWq+PDu
         rTeEbyjaANpdAXCqMjWf4ZhPa9ru/mrTU37g+8GSnvW+dOYy8sSGFyAV+5gYAhRuXx97
         E7DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789616583; x=1790221383; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUKooj3G6MZFzE1OIpQtE6ekzTvNkzFnwYCrZqQvghU=;
        b=c326Lo1KGUJtILfh7jqZxqCyYswff43LjawyLfC9MX3mYjwniqPiMQEXvappNUUOi9
         r2vhYXrHmf3JU6cSW9LcayWUzwRNzQN1k8zdnA7FQscxcLUUCsMSa3qFdpCC7pDbtxbd
         wEzdqF+VXqniOJ8TdHlLgpJk/GGGd8qVwFl4gmseijkxgZE1uBEStedDSz/eQwG7LdLG
         bxyuQeYu2ehcrLox88/dtdOxMgxsabeHSTBHt6ViEiFoDyVlj+BGMVRCtHUg2eCPJMuN
         zG7pdFKo+sfsd5EhV23n+Nj+46PzgGGlwVcO17fOnf1vw1OW5guVf5dIpaQVbKry+Dxx
         JuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789616583; x=1790221383;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUKooj3G6MZFzE1OIpQtE6ekzTvNkzFnwYCrZqQvghU=;
        b=PVoDWHX8T/MAsJByCd8wLMBwl/rjz/v1weEklLeho/WTN0dTMWvevpIXPN0rBZptnz
         6OmW8tMsWUa/uLdfk0+MWNsiDvb3nd5gWEEIH9CNDfF7NKqQr3CdMzU17zBje8f8dVyI
         HMOMawgDJ1SGom4Ih/jpD/bYs9C1pKxfi0ZCgUtWk2yy0C/YNoLk5+AmL41qNFQfLjAd
         EkhmjbK8NjRzLByrUKKd+3RfrIyHGt7YT9Wjtr/A7qSo/En/6pm2Ni63qpPRZbg8IWmK
         NqY/3AyHEaoOmKdFQCzPmy6Noc1XZjaxDAbAwCMXxs62D1sB/QRQVfAfQM3vt4DLOiGR
         b0ZQ==
X-Gm-Message-State: AFuF++kWz68Zxt8WQHRIreDE7TMkJfS/e12s2+D/TGJe7kzHn4TxsaAZ
	KaG5Rx5fB3UEQPgum993CSTqYjWxHPo7pzXKYCHqe2Lxd5O4OAehSjda6pNMoGewX1ZbaWGGMsC
	r5zQirOa0HVZ99uBvsSxWF72iymHQyZS+c9oh4ZVEMe0g
X-Gm-Gg: AYBFou3jOIcdgqu0obrrXXRxoZ5sgHfHcriH6Rn7ER5/pZ6SQ5F1fs5fkk22W6kjaXY
	ujkACmGY24jH1y+lbjlFc0CAQ3u3gQ7rOh/MsRNQzrpPhx/uhy7DRvyRjWjViUmj5gw41n6MrbS
	rIxCeKqnsSPjJMfsziUDKyblQbd2bniLcNjAcMROFSiWSsUFns14snOVm4lq/Fj1vaLdxCWz1yz
	y+P63SqVsvk/ABtjhqbehjMvDFoRDMlC9ejMlXqhuIogf8KQOSVxq9S8HBmVPMxO6Yzm1VP7byO
	HWDIvT3rDrX22eFTBmAbUxVLR9uLnikV62yHsjRve1j0X1LaF+BFPHqyqNz6FByxqSkdkwtGrxs
	nD8zXhRcziY2NVsnrDSs8b1ly23YH37NTYs/vKc0ZPpl0vQBHSQrKCUKFJR2kC8UDaTWJPg==
X-Received: by 2002:a05:6214:248f:b0:90e:939f:70bf with SMTP id
 6a1803df08f44-9123d7314bamr91512256d6.15.1789616582652; Wed, 16 Sep 2026
 20:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: www.rokinthanp03@gmail.com
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Thu, 17 Sep 2026 09:12:44 +0530
X-Gm-Features: AcwNN1Vya4oV7C-YT2uCrjkL_4u_96CmWQoS-YQbFFbSVnGdRrUHXUWYyce2KsY
Message-ID: <CAHzb5FFF3C12pCWa0kdDGv8FRPeZJ5+wevz7Lvyd+AzGK7MBug@mail.gmail.com>
Subject: [PATCH v3] media: v4l2-ctrls: do nothing if controls[0] == NULL in
 cluster functions
To: linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com, 
	linux-media@vger.kernelorg, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
Content-Type: multipart/mixed; boundary="000000000000b191ea065ba594ef"

--000000000000b191ea065ba594ef
Content-Type: text/plain; charset="UTF-8"

The V4L2 control framework is designed to allow drivers to instantiate
    controls and clusters without checking for errors after each call,
    checking hdl->error only once at the end.

    However, if allocating the master control (controls[0]) fails, e.g. due to
    memory allocation failure, v4l2_ctrl_cluster() triggers a WARNING:
      ncontrols == 0 || controls[0] == NULL
      WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
  v4l2_ctrl_cluster

    Additionally, v4l2_ctrl_auto_cluster() attempts to dereference
    master->minimum without checking if controls[0] is NULL, leading to a
    NULL pointer dereference when master control creation fails.

    Update both v4l2_ctrl_cluster() and v4l2_ctrl_auto_cluster() to silently
    return if controls[0] is NULL, preserving the design that control
    creation errors are caught at the end when the driver checks hdl->error.
    Also update function documentation in include/media/v4l2-ctrls.h.

    Fixes: 71c689dc2e73 ("media: v4l2-ctrls: split up into four source files")
    Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=cf896de36144391bcde1
    Suggested-by: Hans Verkuil <hverkuil@kernel.org>
    Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
    ---
    v2 -> v3:
    - Fix the issue in the V4L2 core (v4l2-ctrls-core.c) instead of hackrf,
      as suggested by Hans Verkuil.
    - Return early if controls[0] == NULL in both v4l2_ctrl_cluster() and
      v4l2_ctrl_auto_cluster().
    - Update function documentation in include/media/v4l2-ctrls.h.
    - Revert hackrf driver changes.

    v1 -> v2:
    - Corrected commit hash in Fixes tag.

     drivers/media/v4l2-core/v4l2-ctrls-core.c | 16 ++++++++++++----
     include/media/v4l2-ctrls.h                |  4 ++++
     2 files changed, 16 insertions(+), 4 deletions(-)

    diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-
  core/v4l2-ctrls-core.c
    --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
    +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
    @@ -2490,7 +2490,10 @@ void v4l2_ctrl_cluster(unsigned ncontrols, struct
  v4l2_ctrl **controls)
         int i;

         /* The first control is the master control and it must not be
NULL */
    -    if (WARN_ON(ncontrols == 0 || controls[0] == NULL))
    +    if (WARN_ON(ncontrols == 0))
    +        return;
    +
    +    if (!controls[0])
             return;

         for (i = 0; i < ncontrols; i++) {
    @@ -2508,12 +2511,17 @@ EXPORT_SYMBOL(v4l2_ctrl_cluster);
     void v4l2_ctrl_auto_cluster(unsigned ncontrols, struct v4l2_ctrl
**controls,
                     u8 manual_val, bool set_volatile)
     {
    -    struct v4l2_ctrl *master = controls[0];
    +    struct v4l2_ctrl *master;
         u32 flag = 0;
         int i;

    +    if (WARN_ON(ncontrols <= 1))
    +        return;
    +
    +    if (!controls[0])
    +        return;
    +
    +    master = controls[0];
         v4l2_ctrl_cluster(ncontrols, controls);
    -    WARN_ON(ncontrols <= 1);
         WARN_ON(manual_val < master->minimum || manual_val > master->maximum);
         WARN_ON(set_volatile && !has_op(master, g_volatile_ctrl));
         master->is_auto = true;
    diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
    --- a/include/media/v4l2-ctrls.h
    +++ b/include/media/v4l2-ctrls.h
    @@ -834,6 +834,8 @@ struct v4l2_ctrl_config {
      *
      * @ncontrols:    The number of controls in this cluster.
      * @controls:    The cluster control array of size @ncontrols.
    + *
    + * If controls[0] is NULL, then this function does nothing and
just returns.
      */
     void v4l2_ctrl_cluster(unsigned int ncontrols, struct v4l2_ctrl
**controls);

    @@ -868,6 +870,8 @@ void v4l2_ctrl_cluster(unsigned int ncontrols, struct
  v4l2_ctrl **controls);
      * In addition, this function will set the %V4L2_CTRL_FLAG_UPDATE flag
      * on the autofoo control and %V4L2_CTRL_FLAG_INACTIVE on the foo
  control(s)
      * if autofoo is in auto mode.
    + *
    + * If controls[0] is NULL, then this function does nothing and
just returns.
      */
     void v4l2_ctrl_auto_cluster(unsigned int ncontrols,
                     struct v4l2_ctrl **controls,

--000000000000b191ea065ba594ef
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-media-v4l2-ctrls-do-nothing-if-controls-0-is-NULL-in.patch"
Content-Disposition: attachment; 
	filename="0001-media-v4l2-ctrls-do-nothing-if-controls-0-is-NULL-in.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mu4zhl020>
X-Attachment-Id: f_mu4zhl020

RnJvbTogUm9oaW50aGFuIDxyb2tpbnRoYW5wMDNAZ21haWwuY29tPgpTdWJqZWN0OiBbUEFUQ0gg
djNdIG1lZGlhOiB2NGwyLWN0cmxzOiBkbyBub3RoaW5nIGlmIGNvbnRyb2xzWzBdID09IE5VTEwg
aW4gY2x1c3RlciBmdW5jdGlvbnMKRGF0ZTogRnJpLCAxMSBTZXAgMjAyNiAxODo1NTowMCArMDUz
MAoKVGhlIFY0TDIgY29udHJvbCBmcmFtZXdvcmsgaXMgZGVzaWduZWQgdG8gYWxsb3cgZHJpdmVy
cyB0byBpbnN0YW50aWF0ZQpjb250cm9scyBhbmQgY2x1c3RlcnMgd2l0aG91dCBjaGVja2luZyBm
b3IgZXJyb3JzIGFmdGVyIGVhY2ggY2FsbCwKY2hlY2tpbmcgaGRsLT5lcnJvciBvbmx5IG9uY2Ug
YXQgdGhlIGVuZC4KCkhvd2V2ZXIsIGlmIGFsbG9jYXRpbmcgdGhlIG1hc3RlciBjb250cm9sIChj
b250cm9sc1swXSkgZmFpbHMsIGUuZy4gZHVlIHRvCm1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUs
IHY0bDJfY3RybF9jbHVzdGVyKCkgdHJpZ2dlcnMgYSBXQVJOSU5HOgogIG5jb250cm9scyA9PSAw
IHx8IGNvbnRyb2xzWzBdID09IE5VTEwKICBXQVJOSU5HOiBkcml2ZXJzL21lZGlhL3Y0bDItY29y
ZS92NGwyLWN0cmxzLWNvcmUuYzoyNTI1IGF0IHY0bDJfY3RybF9jbHVzdGVyCgpBZGRpdGlvbmFs
bHksIHY0bDJfY3RybF9hdXRvX2NsdXN0ZXIoKSBhdHRlbXB0cyB0byBkZXJlZmVyZW5jZQptYXN0
ZXItPm1pbmltdW0gd2l0aG91dCBjaGVja2luZyBpZiBjb250cm9sc1swXSBpcyBOVUxMLCBsZWFk
aW5nIHRvIGEKTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gbWFzdGVyIGNvbnRyb2wgY3Jl
YXRpb24gZmFpbHMuCgpVcGRhdGUgYm90aCB2NGwyX2N0cmxfY2x1c3RlcigpIGFuZCB2NGwyX2N0
cmxfYXV0b19jbHVzdGVyKCkgdG8gc2lsZW50bHkKcmV0dXJuIGlmIGNvbnRyb2xzWzBdIGlzIE5V
TEwsIHByZXNlcnZpbmcgdGhlIGRlc2lnbiB0aGF0IGNvbnRyb2wKY3JlYXRpb24gZXJyb3JzIGFy
ZSBjYXVnaHQgYXQgdGhlIGVuZCB3aGVuIHRoZSBkcml2ZXIgY2hlY2tzIGhkbC0+ZXJyb3IuCkFs
c28gdXBkYXRlIGZ1bmN0aW9uIGRvY3VtZW50YXRpb24gaW4gaW5jbHVkZS9tZWRpYS92NGwyLWN0
cmxzLmguCgpGaXhlczogNzFjNjg5ZGMyZTczICgibWVkaWE6IHY0bDItY3RybHM6IHNwbGl0IHVw
IGludG8gZm91ciBzb3VyY2UgZmlsZXMiKQpSZXBvcnRlZC1ieTogc3l6Ym90K2NmODk2ZGUzNjE0
NDM5MWJjZGUxQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KQ2xvc2VzOiBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9Y2Y4OTZkZTM2MTQ0MzkxYmNkZTEKU3VnZ2VzdGVk
LWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFJv
aGludGhhbiA8cm9raW50aGFucDAzQGdtYWlsLmNvbT4KLS0tCnYyIC0+IHYzOgotIEZpeCB0aGUg
aXNzdWUgaW4gdGhlIFY0TDIgY29yZSAodjRsMi1jdHJscy1jb3JlLmMpIGluc3RlYWQgb2YgaGFj
a3JmLAogIGFzIHN1Z2dlc3RlZCBieSBIYW5zIFZlcmt1aWwuCi0gUmV0dXJuIGVhcmx5IGlmIGNv
bnRyb2xzWzBdID09IE5VTEwgaW4gYm90aCB2NGwyX2N0cmxfY2x1c3RlcigpIGFuZAogIHY0bDJf
Y3RybF9hdXRvX2NsdXN0ZXIoKS4KLSBVcGRhdGUgZnVuY3Rpb24gZG9jdW1lbnRhdGlvbiBpbiBp
bmNsdWRlL21lZGlhL3Y0bDItY3RybHMuaC4KLSBSZXZlcnQgaGFja3JmIGRyaXZlciBjaGFuZ2Vz
LgoKdjEgLT4gdjI6Ci0gQ29ycmVjdGVkIGNvbW1pdCBoYXNoIGluIEZpeGVzIHRhZy4KCiBkcml2
ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWN0cmxzLWNvcmUuYyB8IDE2ICsrKysrKysrKysrKy0t
LS0KIGluY2x1ZGUvbWVkaWEvdjRsMi1jdHJscy5oICAgICAgICAgICAgICAgIHwgIDQgKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItY3RybHMtY29yZS5jIGIvZHJpdmVy
cy9tZWRpYS92NGwyLWNvcmUvdjRsMi1jdHJscy1jb3JlLmMKLS0tIGEvZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdjRsMi1jdHJscy1jb3JlLmMKKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUv
djRsMi1jdHJscy1jb3JlLmMKQEAgLTI0OTAsNyArMjQ5MCwxMCBAQCB2b2lkIHY0bDJfY3RybF9j
bHVzdGVyKHVuc2lnbmVkIG5jb250cm9scywgc3RydWN0IHY0bDJfY3RybCAqKmNvbnRyb2xzKQog
CWludCBpOwogCiAJLyogVGhlIGZpcnN0IGNvbnRyb2wgaXMgdGhlIG1hc3RlciBjb250cm9sIGFu
ZCBpdCBtdXN0IG5vdCBiZSBOVUxMICovCi0JaWYgKFdBUk5fT04obmNvbnRyb2xzID09IDAgfHwg
Y29udHJvbHNbMF0gPT0gTlVMTCkpCisJaWYgKFdBUk5fT04obmNvbnRyb2xzID09IDApKQorCQly
ZXR1cm47CisKKwlpZiAoIWNvbnRyb2xzWzBdKQogCQlyZXR1cm47CiAKIAlmb3IgKGkgPSAwOyBp
IDwgbmNvbnRyb2xzOyBpKyspIHsKQEAgLTI1MDgsMTIgKzI1MTEsMTcgQEAgRVhQT1JUX1NZTUJP
TCh2NGwyX2N0cmxfY2x1c3Rlcik7CiB2b2lkIHY0bDJfY3RybF9hdXRvX2NsdXN0ZXIodW5zaWdu
ZWQgbmNvbnRyb2xzLCBzdHJ1Y3QgdjRsMl9jdHJsICoqY29udHJvbHMsCiAJCQkgICAgdTggbWFu
dWFsX3ZhbCwgYm9vbCBzZXRfdm9sYXRpbGUpCiB7Ci0Jc3RydWN0IHY0bDJfY3RybCAqbWFzdGVy
ID0gY29udHJvbHNbMF07CisJc3RydWN0IHY0bDJfY3RybCAqbWFzdGVyOwogCXUzMiBmbGFnID0g
MDsKIAlpbnQgaTsKIAorCWlmIChXQVJOX09OKG5jb250cm9scyA8PSAxKSkKKwkJcmV0dXJuOwor
CisJaWYgKCFjb250cm9sc1swXSkKKwkJcmV0dXJuOworCisJbWFzdGVyID0gY29udHJvbHNbMF07
CiAJdjRsMl9jdHJsX2NsdXN0ZXIobmNvbnRyb2xzLCBjb250cm9scyk7Ci0JV0FSTl9PTihuY29u
dHJvbHMgPD0gMSk7CiAJV0FSTl9PTihtYW51YWxfdmFsIDwgbWFzdGVyLT5taW5pbXVtIHx8IG1h
bnVhbF92YWwgPiBtYXN0ZXItPm1heGltdW0pOwogCVdBUk5fT04oc2V0X3ZvbGF0aWxlICYmICFo
YXNfb3AobWFzdGVyLCBnX3ZvbGF0aWxlX2N0cmwpKTsKIAltYXN0ZXItPmlzX2F1dG8gPSB0cnVl
OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tZWRpYS92NGwyLWN0cmxzLmggYi9pbmNsdWRlL21lZGlh
L3Y0bDItY3RybHMuaAotLS0gYS9pbmNsdWRlL21lZGlhL3Y0bDItY3RybHMuaAorKysgYi9pbmNs
dWRlL21lZGlhL3Y0bDItY3RybHMuaApAQCAtODM0LDYgKzgzNCw4IEBAIHN0cnVjdCB2NGwyX2N0
cmxfY29uZmlnIHsKICAqCiAgKiBAbmNvbnRyb2xzOglUaGUgbnVtYmVyIG9mIGNvbnRyb2xzIGlu
IHRoaXMgY2x1c3Rlci4KICAqIEBjb250cm9sczoJVGhlIGNsdXN0ZXIgY29udHJvbCBhcnJheSBv
ZiBzaXplIEBuY29udHJvbHMuCisgKgorICogSWYgY29udHJvbHNbMF0gaXMgTlVMTCwgdGhlbiB0
aGlzIGZ1bmN0aW9uIGRvZXMgbm90aGluZyBhbmQganVzdCByZXR1cm5zLgogICovCiB2b2lkIHY0
bDJfY3RybF9jbHVzdGVyKHVuc2lnbmVkIGludCBuY29udHJvbHMsIHN0cnVjdCB2NGwyX2N0cmwg
Kipjb250cm9scyk7CiAKQEAgLTg2OCw2ICs4NzAsOCBAQCB2b2lkIHY0bDJfY3RybF9jbHVzdGVy
KHVuc2lnbmVkIGludCBuY29udHJvbHMsIHN0cnVjdCB2NGwyX2N0cmwgKipjb250cm9scyk7CiAg
KiBJbiBhZGRpdGlvbiwgdGhpcyBmdW5jdGlvbiB3aWxsIHNldCB0aGUgJVY0TDJfQ1RSTF9GTEFH
X1VQREFURSBmbGFnCiAgKiBvbiB0aGUgYXV0b2ZvbyBjb250cm9sIGFuZCAlVjRMMl9DVFJMX0ZM
QUdfSU5BQ1RJVkUgb24gdGhlIGZvbyBjb250cm9sKHMpCiAgKiBpZiBhdXRvZm9vIGlzIGluIGF1
dG8gbW9kZS4KKyAqCisgKiBJZiBjb250cm9sc1swXSBpcyBOVUxMLCB0aGVuIHRoaXMgZnVuY3Rp
b24gZG9lcyBub3RoaW5nIGFuZCBqdXN0IHJldHVybnMuCiAgKi8KIHZvaWQgdjRsMl9jdHJsX2F1
dG9fY2x1c3Rlcih1bnNpZ25lZCBpbnQgbmNvbnRyb2xzLAogCQkJICAgIHN0cnVjdCB2NGwyX2N0
cmwgKipjb250cm9scywKLS0gCg==
--000000000000b191ea065ba594ef--
